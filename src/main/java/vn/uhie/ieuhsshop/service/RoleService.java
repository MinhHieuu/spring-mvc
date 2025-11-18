package vn.uhie.ieuhsshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.Role;
import vn.uhie.ieuhsshop.repository.RoleRepository;

import java.util.List;

@Service
public class RoleService {
    @Autowired
    RoleRepository roleRepository;
    public List<Role> fetchRole() {
        List<Role> roles = this.roleRepository.findAll();
        return roles;
    }
}
