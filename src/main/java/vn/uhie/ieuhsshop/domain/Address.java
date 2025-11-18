package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

@Entity
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer districtId;
    private Integer wardId;
    private Integer provinceId;
    private String streetAddress;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
