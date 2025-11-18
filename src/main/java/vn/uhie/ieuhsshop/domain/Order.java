package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Double totalPrice;
    private int status;
    private LocalDate createdAt;
    private String address;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @OneToOne
    @JoinColumn(name = "payment_id")
    private Payment payment;
    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetails;
}
