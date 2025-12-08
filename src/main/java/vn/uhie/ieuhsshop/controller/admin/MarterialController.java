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
import vn.uhie.ieuhsshop.service.MarterialService;

@Controller
@RequestMapping("/admin")
public class MarterialController {
    @Autowired
    private MarterialService marterialService;
    @GetMapping("marterial")
    public String getPageMarterial(Model model) {
        model.addAttribute("marterials", this.marterialService.fetchMarterial());
        if(!model.containsAttribute("newMarterial")) {
            model.addAttribute("newMarterial", new Marterial());

        }
        return "admin/field/marterial";
    }

    @PostMapping("marterial/create")
    public String createBrand(@ModelAttribute Marterial marterial, RedirectAttributes redirectAttributes){
        if(this.marterialService.fetchMarterialByName(marterial.getName()) == null) {
            this.marterialService.handleSaveMarterial(marterial);
            return "redirect:/admin/marterial";
        }
        redirectAttributes.addFlashAttribute("message", "Đã tồn tại chất liệu này");
        redirectAttributes.addFlashAttribute("newMarterial", marterial);
        return "redirect:/admin/marterial";
    }

    @PostMapping("marterial/update")
    public String handleUpdateBrand(@ModelAttribute Marterial marterial, RedirectAttributes redirectAttributes) {
        if(this.marterialService.fetchMarterialByName(marterial.getName()) == null) {
            this.marterialService.handleSaveMarterial(marterial);
            return "redirect:/admin/marterial";
        }
        redirectAttributes.addFlashAttribute("messageUpdate", "Đã tồn tại chất liệu này");
        redirectAttributes.addFlashAttribute("editmarterial", marterial);
        return "redirect:/admin/marterial";
    }
}
