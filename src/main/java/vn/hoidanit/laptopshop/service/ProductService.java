package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.ProductCriteriaDTO;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;
import vn.hoidanit.laptopshop.repository.CartRepository;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;
import vn.hoidanit.laptopshop.repository.ProductRepository;
import vn.hoidanit.laptopshop.service.Specification.ProductSpecifications;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.userService = userService;
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Page<Product> fetchProductWithSpec(Pageable pageable, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(pageable);
        }
        Specification<Product> combinedSpec = Specification.where(null);
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecifications
                    .matchListFactory(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecifications
                    .matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.builtPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        return this.productRepository.findAll(combinedSpec, pageable);
    }

    public Page<Product> getAllProductByName(Pageable pageable, String name) {
        return this.productRepository.findAll(ProductSpecifications.nameLike(name), pageable);
    }

    public Page<Product> getAllProductByFactory(Pageable pageable, List<String> factorys) {
        if (factorys.size() == 0) {
            return this.productRepository.findAll(pageable);
        }
        return this.productRepository.findAll(ProductSpecifications.matchListFactory(factorys), pageable);
    }

    public Page<Product> getAllProductGreaterThan(Pageable pageable, double minPrice) {
        return this.productRepository.findAll(ProductSpecifications.priceGreaterThan(minPrice), pageable);
    }

    public Page<Product> getAllProductLessThan(Pageable pageable, double maxPrice) {
        return this.productRepository.findAll(ProductSpecifications.priceLessThan(maxPrice), pageable);
    }

    public Page<Product> getAllProductByPrice(Pageable pageable, String price) {
        if (price.equals("duoi-10tr")) {
            return this.productRepository.findAll(ProductSpecifications.priceLessThan(10000000), pageable);
        } else if (price.equals("10tr-den-15tr")) {
            double min = 10000000;
            double max = 15000000;
            return this.productRepository.findAll(ProductSpecifications.matchPrice(min, max), pageable);
        } else if (price.equals("15tr-den-20tr")) {
            double min = 15000000;
            double max = 20000000;
            return this.productRepository.findAll(ProductSpecifications.matchPrice(min, max), pageable);
        } else if (price.equals("20tr-den-25tr")) {
            double min = 20000000;
            double max = 25000000;
            return this.productRepository.findAll(ProductSpecifications.matchPrice(min, max), pageable);
        } else if (price.equals("25tr-den-30tr")) {
            double min = 25000000;
            double max = 30000000;
            return this.productRepository.findAll(ProductSpecifications.matchPrice(min, max), pageable);
        } else if (price.equals("tren-30tr")) {
            return this.productRepository.findAll(ProductSpecifications.priceGreaterThan(30000000), pageable);
        }
        return this.productRepository.findAll(pageable);
    }

    public Specification<Product> builtPriceSpecification(List<String> prices) {
        // Specification<Product> combinedSpec = (root, query, criteriaBuilder) ->
        // criteriaBuilder.disjunction();
        Specification<Product> combinedSpec = Specification.where(null);
        for (String p : prices) {
            double min = 0;
            double max = 0;
            switch (p) {
                case "duoi-10tr":
                    min = 1;
                    max = 10000000;
                    break;
                case "10tr-den-15tr":
                    min = 10000000;
                    max = 15000000;
                    break;
                case "15tr-den-20tr":
                    min = 15000000;
                    max = 20000000;
                    break;
                case "20tr-den-25tr":
                    min = 20000000;
                    max = 25000000;
                    break;
                case "25tr-den-30tr":
                    min = 25000000;
                    max = 30000000;
                    break;
                case "tren-30tr":
                    min = 30000000;
                    max = 900000000;
                    break;
                default:
                    break;
            }
            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpecifications.matchMultiPrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }
        return combinedSpec;
    }

    public Page<Product> fetchProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
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

    public void handleAddProductToCart(String email, long productId, long quantity, HttpSession session) {
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
                    cartDetail.setQuantity(quantity);
                    this.cartDetailRepository.save(cartDetail);
                    // Update sum
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldCartDetail.setQuantity(oldCartDetail.getQuantity() + quantity);
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

    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName,
            String receiverAddress,
            String receiverPhone,
            double totalPrice) {
        // Create order
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(receiverName);
        order.setReceiverAddress(receiverAddress);
        order.setReceiverPhone(receiverPhone);
        order.setTotalPrice(totalPrice);
        order.setStatus("PENDING");
        order = this.orderRepository.save(order);
        // Create order detail

        // Step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetail();
            if (cartDetails != null) {
                for (CartDetail cartDetail : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setPrice(cartDetail.getPrice());
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    orderDetail.setProduct(cartDetail.getProduct());
                    orderDetail.setOrder(order);
                    this.orderDetailRepository.save(orderDetail);
                }
                // Step 2: delete cart and cart detail
                for (CartDetail cartDetail : cartDetails) {
                    this.cartDetailRepository.deleteById(cartDetail.getId());
                }
                this.cartRepository.deleteById(cart.getId());

                // Step 3: update session
                session.setAttribute("sum", 0);
            }
        }

    }
}
