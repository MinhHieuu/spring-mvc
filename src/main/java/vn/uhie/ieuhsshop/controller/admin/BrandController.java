package vn.uhie.ieuhsshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.uhie.ieuhsshop.domain.Brand;
import vn.uhie.ieuhsshop.service.BrandService;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class BrandController {
    @Autowired
    private BrandService brandService;
    @GetMapping("brand")
    public String getPageBrand(Model model) {
        List<Brand> categories = brandService.fecthAllBrand();
        model.addAttribute("brands", categories);
        model.addAttribute("newBrand", new Brand());
        return "/admin/brand";
    }

    @PostMapping("brand/add")
    public String createCategory(@ModelAttribute("newBrand") Brand newBrand, Model model){
        Brand brand = this.brandService.fecthBrandByName(newBrand.getName());
        if(brand == null){
            this.brandService.handleSaveBrand(newBrand);
            return  "redirect:/admin/brand";
        }else {
            String message = "Thương hiệu đã tồn tại";
            model.addAttribute("message", message);
            return "/admin/brand";
        }
    }

    @PostMapping("brand/update")
    public String updateCategory(@ModelAttribute Brand brand){
        Brand newBrand = this.brandService.fectchBrandById(brand.getId());
        if(newBrand != null) {
            newBrand.setName(brand.getName());
            this.brandService.handleSaveBrand(newBrand);
            return "redirect:/admin/brand";
        }else {
            String message = "Thương hiệu không tồn tại";
            return "/admin/brand";
        }
    }
}
