package vn.uhie.ieuhsshop.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String getPageLogin(){
        return "user/login";
    }
    @GetMapping("/register")
    public String getPageRegister(){
        return "user/register";
    }
}
