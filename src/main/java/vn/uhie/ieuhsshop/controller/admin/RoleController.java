package vn.uhie.ieuhsshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.uhie.ieuhsshop.domain.Role;

@Controller
@RequestMapping("/admin")
public class RoleController {
    @GetMapping("roles")
    public String getPage(Model model){
        model.addAttribute("newRole", new Role());
        return "/admin/role";
    }

    @PostMapping("roles")
    public String createRoles(@ModelAttribute("newRole") Role role){
        System.out.println(role.toString());
        return "/admin/role";

    }
}
