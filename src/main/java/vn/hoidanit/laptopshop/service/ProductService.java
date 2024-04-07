package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    public Product getProductByName(String name) {
        return this.productRepository.findByName(name);
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        // Check user da co cart chua ? Neu chua -> Tao moi
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                // tao moi card
                Cart otheCart = new Cart();
                otheCart.setUser(user);
                otheCart.setSum(0);

                cart = this.cartRepository.save(otheCart);
            }
            // tim product by id
            Product product = this.productRepository.findById(productId);
            if (product != null) {
                Product realProduct = product;
                CartDetail oldCartDetail = this.cartDetailRepository.findByProductAndCart(realProduct, cart);
                // save cart detail
                if (oldCartDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(realProduct);
                    cartDetail.setPrice(realProduct.getPrice());
                    cartDetail.setQuantity(1);
                    this.cartDetailRepository.save(cartDetail);
                    // Update sum
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldCartDetail.setQuantity(oldCartDetail.getQuantity() + 1);
                    this.cartDetailRepository.save(oldCartDetail);
                }

            }

        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(CartDetail cartDetail, HttpSession session) {

        if (cartDetail.getQuantity() > 1) {
            cartDetail.setQuantity(cartDetail.getQuantity() - 1);
        } else {
            this.cartDetailRepository.delete(cartDetail);
            Cart cart = cartDetail.getCart();
            int sum = cart.getSum() - 1;
            if (sum >= 1) {
                cart.setSum(sum);
                this.cartRepository.save(cart);
                session.setAttribute("sum", sum);
            } else {
                this.cartRepository.delete(cart);
                session.setAttribute("sum", 0);
            }
        }

    }

    public void handleUpdateCartBeforeCheckOut(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currCartDetail = cdOptional.get();
                currCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currCartDetail);
            }
        }
    }
}
