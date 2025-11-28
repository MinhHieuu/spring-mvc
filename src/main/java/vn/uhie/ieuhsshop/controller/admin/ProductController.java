package vn.uhie.ieuhsshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class ProductController {
    @GetMapping("prodcut")
    public String getPageProduct(Model model) {
        return "";
    }
}
