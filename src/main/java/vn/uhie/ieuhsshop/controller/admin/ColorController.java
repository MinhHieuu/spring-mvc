package vn.uhie.ieuhsshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.uhie.ieuhsshop.domain.Color;
import vn.uhie.ieuhsshop.service.ColorService;


@Controller
@RequestMapping("/admin")
public class ColorController {
    @Autowired
    private ColorService colorService;
    @GetMapping("color")
    public String getPageSize(Model model) {
        model.addAttribute("colors", this.colorService.fecthAllColor());
        if(!model.containsAttribute("newColor")) {
            model.addAttribute("newColor", new Color());

        }
        return "admin/field/color";
    }

    @PostMapping("color/create")
    public String createColor(@ModelAttribute Color color, RedirectAttributes redirectAttributes){
        if(this.colorService.fecthColorByName(color.getName()) == null) {
            this.colorService.handleSaveColor(color);
            return "redirect:/admin/color";
        }
        redirectAttributes.addFlashAttribute("message", "Đã tồn tại màu này");
        redirectAttributes.addFlashAttribute("newColor", color);
        return "redirect:/admin/color";
    }

    @PostMapping("color/update")
    public String handleUpdateColor(@ModelAttribute Color color, RedirectAttributes redirectAttributes) {
        if(this.colorService.fecthColorByName(color.getName()) == null) {
            this.colorService.handleSaveColor(color);
            return "redirect:/admin/color";
        }
        redirectAttributes.addFlashAttribute("messageUpdate", "Đã có màu này");
        redirectAttributes.addFlashAttribute("editColor", color);
        return "redirect:/admin/color";
    }
}
