package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private Integer status;
    private String image;
    private LocalDate createdAt;
    private LocalDate updatedAt;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User createdBy;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;
    @ManyToOne
    @JoinColumn(name = "marterial_id")
    private Marterial marterial;
    @OneToMany(mappedBy = "product")
    private List<ProductDetail> productDetails;
}
