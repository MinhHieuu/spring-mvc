package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class CartDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int quantity;
    private Double totalPrice;
    @ManyToOne
    @JoinColumn(name = "cart_id")
    private Cart cart;
    @ManyToOne
    @JoinColumn(name = "product_detail_id")
    private ProductDetail productDetail;
}
