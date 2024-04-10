package vn.hoidanit.laptopshop.service.Specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Product_;

public class ProductSpecifications {

    public static Specification<Product> nameLike(String factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + factory + "%");
    }

    public static Specification<Product> priceGreaterThan(double price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.ge(root.get(Product_.PRICE), price);
    }

    public static Specification<Product> priceLessThan(double price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.le(root.get(Product_.PRICE), price);
    }

    public static Specification<Product> factoryEqual(List<String> factorys) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.FACTORY)).value(factorys);
    }

    public static Specification<Product> matchPrice(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(
                criteriaBuilder.ge(root.get(Product_.PRICE), min),
                criteriaBuilder.le(root.get(Product_.PRICE), max));
    }

    public static Specification<Product> matchMultiPrice(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get(Product_.PRICE), min, max);
    }

}
