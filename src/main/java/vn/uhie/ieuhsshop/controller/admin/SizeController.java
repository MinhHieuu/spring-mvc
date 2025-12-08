package vn.uhie.ieuhsshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.uhie.ieuhsshop.domain.Marterial;
import vn.uhie.ieuhsshop.domain.Size;
import vn.uhie.ieuhsshop.service.SizeService;

@Controller
@RequestMapping("/admin")
public class SizeController {
    @Autowired
    private SizeService sizeService;
    @GetMapping("size")
    public String getPageSize(Model model) {
        model.addAttribute("sizes", this.sizeService.fetchSize());
        if(!model.containsAttribute("newSize")) {
            model.addAttribute("newSize", new Size());

        }
        return "admin/field/size";
    }

    @PostMapping("size/create")
    public String createSize(@ModelAttribute Size size, RedirectAttributes redirectAttributes){
        if(this.sizeService.fecthSizeByName(size.getName()) == null) {
            this.sizeService.handleSaveSize(size);
            return "redirect:/admin/size";
        }
        redirectAttributes.addFlashAttribute("message", "Đã có kích thước này");
        redirectAttributes.addFlashAttribute("newSize", size);
        return "redirect:/admin/size";
    }

    @PostMapping("size/update")
    public String handleUpdateSize(@ModelAttribute Size size, RedirectAttributes redirectAttributes) {
        if(this.sizeService.fecthSizeByName(size.getName()) == null) {
            this.sizeService.handleSaveSize(size);
            return "redirect:/admin/size";
        }
        redirectAttributes.addFlashAttribute("messageUpdate", "Đã có kích thước này");
        redirectAttributes.addFlashAttribute("editSize", size);
        return "redirect:/admin/size";
    }
}
