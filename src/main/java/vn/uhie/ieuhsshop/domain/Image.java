package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

@Entity
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String url;
    @ManyToOne
    @JoinColumn(name = "product_detail_id")
    private ProductDetail productDetail;
}
