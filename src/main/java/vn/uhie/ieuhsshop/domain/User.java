package vn.uhie.ieuhsshop.domain;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String password;
    private String fullName;
    private String phone;
    private String avatar;
    private LocalDate createdAt;
    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;
    @OneToMany(mappedBy = "user")
    private List<Address> addressList;
    @OneToOne(mappedBy = "user")
    private Cart cart;
}
