package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int sum;
    @OneToOne
    @JoinColumn(name = "user_id", unique = true)
    private User user;
    @OneToMany(mappedBy = "cart")
    private List<CartDetail> cartDetail;
}
