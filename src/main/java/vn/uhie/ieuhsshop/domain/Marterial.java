package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Marterial {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @OneToMany(mappedBy = "marterial")
    private List<Product> products;
}
