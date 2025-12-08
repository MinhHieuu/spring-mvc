package vn.uhie.ieuhsshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.uhie.ieuhsshop.domain.Brand;
import vn.uhie.ieuhsshop.domain.Category;
import vn.uhie.ieuhsshop.domain.Marterial;
import vn.uhie.ieuhsshop.domain.Product;
import vn.uhie.ieuhsshop.service.*;

import java.time.LocalDate;

import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/admin")
public class ProductController {
    private final CategoryService categoryService;
    private final MarterialService marterialService;
    private final BrandService brandService;
    private final ProductService productService;
    private final UploadService uploadService;
    public ProductController(CategoryService categoryService, MarterialService marterialService,
                             BrandService brandService, ProductService productService, UploadService uploadService) {
        this.categoryService = categoryService;
        this.marterialService = marterialService;
        this.brandService = brandService;
        this.productService = productService;
        this.uploadService = uploadService;
    }
    @GetMapping("product")
    public String getPageProduct(Model model) {
        model.addAttribute("products", this.productService.fetchProduct());
        model.addAttribute("newProduct", new Product());
        return "admin/product/product";
    }

    @ModelAttribute("listCategory")
    public List<Category> getCategory() {
        return this.categoryService.fetchCategory();
    }

    @ModelAttribute("listMarterial")
    public List<Marterial> getMarterial() {
        return this.marterialService.fetchMarterial();
    }

    @ModelAttribute("listBrand")
    public List<Brand> getBrand() {
        List<Brand> brands = this.brandService.fecthAllBrand();
        return brands;
    }

//    @GetMapping("/product/create")
//    public String getPageCreateProduct(Model model){
//        model.addAttribute("newProduct", new Product());
//        return "admin/product/create";
//    }
    @PostMapping("product/create")
    public String handleCreateProduct(@ModelAttribute("newProduct") @Valid Product product,
                                BindingResult bindingResult, @RequestParam("imgFile")MultipartFile file,
                                      Model model) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for(FieldError error : errors) {
            System.out.println("----" + error.getField() + "-----" + error.getDefaultMessage());
        }
        if(bindingResult.hasErrors()) {
            model.addAttribute("products", this.productService.fetchProduct());
            model.addAttribute("messageError", "Create");
            return "admin/product/product";
        }
        product.setCreatedAt(LocalDate.now());
        product.setImage(this.uploadService.handleSaveUploadFile(file, "product"));
        this.productService.handleSaveProduct(product);
        model.addAttribute("message", "Thêm thành công");
        model.addAttribute("messageType", "success");
        return "redirect:/admin/product";
    }

//    @GetMapping("product/update-product/{id}")
//    public String getPageUpdate(@PathVariable("id") Long id, Model model) {
//        Product product = this.productService.fetchProductById(id);
//        model.addAttribute("product", product);
//        model.addAttribute("oldImg", product.getImage());
//        return "admin/product/update";
//    }

    @PostMapping("product/update")
    public String handleUpdateProduct(@ModelAttribute @Valid Product newProduct, BindingResult bindingResult,
                                      @RequestParam("imgFile")MultipartFile file,
                                      Model model) {
        Product product = this.productService.fetchProductById(newProduct.getId());
        List<FieldError> errors = bindingResult.getFieldErrors();
        for(FieldError error : errors) {
            System.out.println("----" + error.getField() + "-----" + error.getDefaultMessage());
            System.out.println(error.getObjectName());
        }
        if(bindingResult.hasErrors()) {
            model.addAttribute("messageError", "Update");
            model.addAttribute("newProduct", new Product());
            model.addAttribute("products", this.productService.fetchProduct());
            model.addAttribute("oldImg", product.getImage());
            String errorName = "";
            for(FieldError error : errors) {
               if(error.getField().equals("name")){
                   errorName = error.getDefaultMessage();
               };
            }
            model.addAttribute("errorName", errorName);
            model.addAttribute("product", newProduct);
            return "admin/product/product";
        }
        product.setUpdatedAt(LocalDate.now());
        product.setName(newProduct.getName());
        product.setBrand(newProduct.getBrand());
        product.setCategory(newProduct.getCategory());
        product.setMarterial(newProduct.getMarterial());
        if(!file.isEmpty()){
            uploadService.deleteFile(product.getImage(), "product");
            product.setImage(this.uploadService.handleSaveUploadFile(file, "product"));
        }
        product.setStatus(newProduct.getStatus());
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }
}
