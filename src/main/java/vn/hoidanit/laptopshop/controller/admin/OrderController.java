package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.service.OrderDetailService;
import vn.hoidanit.laptopshop.service.OrderService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class OrderController {
    private final OrderService orderService;
    private final OrderDetailService orderDetailService;

    public OrderController(OrderService orderService, OrderDetailService orderDetailService) {
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model) {
        List<Order> orders = this.orderService.fetchAll();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(@PathVariable("id") long id, Model model) {
        Optional<Order> opOrder = this.orderService.fetchById(id);
        if (opOrder.isPresent()) {
            model.addAttribute("orderDetails", opOrder.get().getOrderDetail());
        }
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(@PathVariable("id") long id,
            @ModelAttribute("deleteOrder") Order deleteOrder, Model model) {
        model.addAttribute("deleteOrder", new Order());
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String deleteOrder(@ModelAttribute("deleteOrder") Order deleteOrder, Model model) {
        Optional<Order> opOrder = this.orderService.fetchById(deleteOrder.getId());
        if (opOrder.isPresent()) {
            List<OrderDetail> orderDetails = opOrder.get().getOrderDetail();
            for (OrderDetail od : orderDetails) {
                this.orderDetailService.deleteOrderDetail(od);
            }
            this.orderService.deleteOrder(opOrder.get());
        }
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(
            @PathVariable("id") long id, @ModelAttribute("updateOrder") Order updateOrder,
            Model model) {
        Optional<Order> order = this.orderService.fetchById(id);
        if (order.isPresent()) {
            model.addAttribute("updateOrder", order.get());
        }
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String updateOrderStatus(@ModelAttribute("updateOrder") Order updateOrder) {
        this.orderService.handleUpdateOrder(updateOrder);
        return "redirect:/admin/order";
    }

}
