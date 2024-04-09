package vn.hoidanit.laptopshop.service.Specification;

import org.springframework.data.jpa.domain.Specification;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Product_;

public class ProductSpecifications {

    public static Specification<Product> nameLike(String factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + factory + "%");
    }

    public static Specification<Product> priceGreaterThan(double price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThan(root.get(Product_.PRICE), price);
    }

    public static Specification<Product> priceLessThan(double price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.lessThan(root.get(Product_.PRICE), price);
    }

}
