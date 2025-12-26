package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;

import java.util.List;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "tên sản phẩm không được để trống")
    @Size(max=100)
    private String name;
    @NotNull(message = "phải chọn trạng thái")
    private Integer status;
    private String image;
    private LocalDate createdAt;
    private LocalDate updatedAt;
    @ManyToOne
    @JoinColumn(name = "category_id")
    @NotNull(message = "phải chọn danh mục cho sản phẩm")
    private Category category;
    @ManyToOne
    @JoinColumn(name = "brand_id")
    @NotNull(message = "phải chọn thương hiệu")
    private Brand brand;
    @ManyToOne
    @JoinColumn(name = "marterial_id")
    @NotNull(message = "phải chọn chất liệu")
    private Marterial marterial;
    @OneToMany(mappedBy = "product")
    private List<ProductDetail> productDetails;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public LocalDate getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDate getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDate updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Marterial getMarterial() {
        return marterial;
    }

    public void setMarterial(Marterial marterial) {
        this.marterial = marterial;
    }

    public List<ProductDetail> getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(List<ProductDetail> productDetails) {
        this.productDetails = productDetails;
    }
}
