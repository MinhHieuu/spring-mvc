package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Size {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @OneToMany(mappedBy = "size")
    private List<ProductDetail> productDetails;
}
