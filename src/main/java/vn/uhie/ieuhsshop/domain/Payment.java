package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

@Entity
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int method;
    private int status;
    private Double amount;
    private LocalDate paymentDate;
    private String transactionCode;
    private LocalDate createdAt;
    @OneToOne(mappedBy = "payment")
    private Order order;
    @ManyToOne
    @JoinColumn(name = "payment_method_id")
    private PaymentMethod paymentMethod;
}
