package vn.uhie.ieuhsshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class DashboardController {
    @GetMapping("")
    public String getPageDashborad(){
        return "admin/dashboard";
    }
}
