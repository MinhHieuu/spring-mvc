package vn.uhie.ieuhsshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.uhie.ieuhsshop.domain.Category;
import vn.uhie.ieuhsshop.service.CategoryService;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    @GetMapping("category")
    public String getPageCategory(Model model) {
        if (!model.containsAttribute("newCategory")) {
            model.addAttribute("newCategory", new Category());
        }

        model.addAttribute("categories", categoryService.fetchCategory());
        return "admin/field/category";

    }

    @PostMapping("category/add")
    public String createCategory(@ModelAttribute("newCategory") Category newCategory,
                                 RedirectAttributes redirectAttributes){
        Category category = this.categoryService.fetchCategoryByName(newCategory.getName());
        if(category == null){
            this.categoryService.handleSaveCategory(newCategory);
            return  "redirect:/admin/category";
        }else {
            redirectAttributes.addFlashAttribute("message", "Danh mục đã tồn tại");
            redirectAttributes.addFlashAttribute("newCategory", newCategory);
            return "redirect:/admin/category";

        }
    }

    @PostMapping("category/update")
    public String updateCategory(@ModelAttribute Category category,
                                 RedirectAttributes redirectAttributes){
        if(this.categoryService.fetchCategoryByName(category.getName()) != null) {
            redirectAttributes.addFlashAttribute("messageUpdate", "Đã có danh mục này");
            redirectAttributes.addFlashAttribute("editCategory", category);
            return "redirect:/admin/category";
        }
        this.categoryService.handleSaveCategory(category);
        return "redirect:/admin/category";
    }
}
