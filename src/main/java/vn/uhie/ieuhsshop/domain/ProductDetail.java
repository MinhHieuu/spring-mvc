package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

@Entity
public class ProductDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Double costPrice;
    private Double salePrice;
    private Integer quantity;
    private String description;
    private LocalDate creaedAt;
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
    @ManyToOne
    @JoinColumn(name = "color_id")
    private Color color;
    @ManyToOne
    @JoinColumn(name = "size_id")
    private Size size;
    @OneToMany(mappedBy = "productDetail")
    private List<CartDetail> cartDetails;
    @OneToMany(mappedBy = "productDetail")
    private List<Image> images;
}
