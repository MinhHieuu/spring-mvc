package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class PaymentMethod {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private int status;
    @OneToMany(mappedBy = "paymentMethod")
    private List<Payment> payments;
}
