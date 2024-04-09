package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductTable(Model model, @RequestParam("page") int page) {
        Pageable pageable = PageRequest.of(page - 1, 3);
        Page<Product> pageProduct = this.productService.getAllProduct(pageable);
        List<Product> products = pageProduct.getContent();
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pageProduct.getTotalPages());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCrateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProduct(Model model, @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newProductBindingResult,
            @RequestParam("productFile") MultipartFile file) {

        if (newProductBindingResult.hasErrors()) {
            return "/admin/product/create";
        }

        String image = this.uploadService.handleUploadFile(file, "product");
        newProduct.setImage(image);
        newProduct.setSoil(newProduct.getQuantity());
        this.productService.handleSaveProduct(newProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        model.addAttribute("updateProduct", this.productService.getProductById(id));
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model, @ModelAttribute("updateProduct") @Valid Product updateProduct,
            BindingResult updateProductBindingResult,
            @RequestParam("productFile") MultipartFile file) {
        if (updateProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }
        Product currenProduct = this.productService.getProductById(updateProduct.getId());
        if (currenProduct != null) {

            if (!file.isEmpty()) {
                String image = this.uploadService.handleUploadFile(file, "product");
                currenProduct.setImage(image);
            }
            currenProduct.setName(updateProduct.getName());
            currenProduct.setShortDesc(updateProduct.getShortDesc());
            currenProduct.setPrice(updateProduct.getPrice());
            currenProduct.setQuantity(updateProduct.getQuantity());
            currenProduct.setFactory(updateProduct.getFactory());
            currenProduct.setTarget(updateProduct.getTarget());
            currenProduct.setDetailDesc(updateProduct.getDetailDesc());
            this.productService.handleSaveProduct(currenProduct);
        }
        return "redirect:/admin/product/" + updateProduct.getId();
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("deleteProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(@ModelAttribute("deleteProduct") Product product) {
        this.productService.deleteProductById(product.getId());
        return "redirect:/admin/product";
    }

}
