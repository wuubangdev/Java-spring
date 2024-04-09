package vn.hoidanit.laptopshop.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    public Optional<CartDetail> fetchById(long id) {
        return this.cartDetailRepository.findById(id);
    }

    public CartDetail findByProduct(Product product) {
        return this.findByProduct(product);
    }
}
