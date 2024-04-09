package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<Order> fetchAll() {
        return this.orderRepository.findAll();
    }

    public Page<Order> getAllOrder(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Optional<Order> fetchById(long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteOrder(Order order) {
        this.orderRepository.delete(order);
    }

    public void handleUpdateOrder(Order order) {
        Optional<Order> opOrder = this.orderRepository.findById(order.getId());
        if (opOrder.isPresent()) {
            Order updateOrder = opOrder.get();
            updateOrder.setStatus(order.getStatus());
            this.orderRepository.save(updateOrder);
        }
    }
}
