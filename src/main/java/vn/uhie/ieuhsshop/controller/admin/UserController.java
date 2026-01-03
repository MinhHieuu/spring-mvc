package vn.uhie.ieuhsshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.uhie.ieuhsshop.domain.Role;
import vn.uhie.ieuhsshop.domain.User;
import vn.uhie.ieuhsshop.service.RoleService;
import vn.uhie.ieuhsshop.service.UploadService;
import vn.uhie.ieuhsshop.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class UserController {
    private UserService userService;
    private RoleService roleService;
    private UploadService uploadServicel;
    private PasswordEncoder passwordEncoder;
    public UserController(UserService userService, RoleService roleService,
                          UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.uploadServicel = uploadService;
        this.passwordEncoder = passwordEncoder;
    }
    @GetMapping("user")
    public String getPageUser(Model model) {
        model.addAttribute("listUser", this.userService.fetchUser());
        return "admin/user/show";
    }

    @ModelAttribute("roles")
    private List<Role> listRole() {
        return this.roleService.fetchRole();
    }

    @GetMapping("user/create")
    public String getPageCreate(Model model){
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("user/create")
    public String handleCreateUser(@ModelAttribute("newUser") @Valid User user, BindingResult bindingResult,
                                   Model model, @RequestParam("imgFile") MultipartFile file) {
        if(bindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadServicel.handleSaveUploadFile(file, "avatar");
        user.setAvatar(avatar);
        String password = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(password);
//        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }
}
