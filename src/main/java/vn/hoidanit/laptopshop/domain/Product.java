package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty(message = "Tên sản phẩm phải có ít nhất 6 ký tự")
    private String name;

    @NotNull
    @DecimalMin(value = "0", inclusive = false, message = "Giá bán phải lớn hơn 0")
    private double price;

    private String image;

    @NotNull
    @NotEmpty(message = "Mô tả không được để trống")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    @NotNull(message = "Mô tả không được để trống")
    @NotEmpty(message = "Mô tả ngắn phải có ít nhất 6 ký tự")
    private String shortDesc;

    @NotNull
    @Min(value = 1, message = "Số lượng phải bằng hoặc lớn hơn 1")
    private long quantity;
    private long soil;
    private String factory;
    private String target;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSoil() {
        return soil;
    }

    public void setSoil(long soil) {
        this.soil = soil;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

}
