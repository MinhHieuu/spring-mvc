package vn.uhie.ieuhsshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.uhie.ieuhsshop.domain.Brand;
import vn.uhie.ieuhsshop.service.BrandService;



@Controller
@RequestMapping("/admin")
public class BrandController {
    @Autowired
    private BrandService brandService;
    @GetMapping("brand")
    public String getPageBrand(Model model) {
        if(!model.containsAttribute("newBrand")) {
            model.addAttribute("newBrand", new Brand());
        }
        model.addAttribute("brands", this.brandService.fecthAllBrand());
        return "admin/product/brand";
    }

    @PostMapping("brand/create")
    public String createBrand(@ModelAttribute("newBrand") Brand brand, RedirectAttributes redirectAttributes){
        if(this.brandService.fecthBrandByName(brand.getName()) == null) {
            this.brandService.handleSaveBrand(brand);
            return "redirect:/admin/brand";
        }
        redirectAttributes.addFlashAttribute("message", "Đã tồn tại thương hiệu này");
        redirectAttributes.addFlashAttribute("newBrand", brand);
        return "redirect:/admin/brand";
    }

    @PostMapping("brand/update")
    public String handleUpdateBrand(@ModelAttribute Brand brand, RedirectAttributes redirectAttributes) {
        if(this.brandService.fecthBrandByName(brand.getName()) == null) {
            this.brandService.handleSaveBrand(brand);
            return "redirect:/admin/brand";
        }
        redirectAttributes.addFlashAttribute("messageUpdate", "Đã tồn tại thương hiệu này");
        redirectAttributes.addFlashAttribute("editBrand", brand);
        return "redirect:/admin/brand";
    }
}
