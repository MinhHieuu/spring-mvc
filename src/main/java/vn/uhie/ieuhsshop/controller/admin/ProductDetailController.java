package vn.uhie.ieuhsshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vn.uhie.ieuhsshop.domain.*;
import vn.uhie.ieuhsshop.service.*;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class ProductDetailController {
    private ProductDetailService productDetailService;
    private ImageService imageService;
    private UploadService uploadService;
    private ProductService productService;
    private ColorService colorService;
    private SizeService sizeService;
    public ProductDetailController(ProductDetailService productDetailService,
                                   ImageService imageService, UploadService uploadService,
                                   ProductService productService, ColorService colorService,
                                   SizeService sizeService) {
        this.productDetailService = productDetailService;
        this.imageService = imageService;
        this.uploadService = uploadService;
        this.productService = productService;
        this.colorService = colorService;
        this.sizeService = sizeService;
    }
    private void handleSaveImage(ProductDetail productDetail, List<String> listUrl){
        for(String url : listUrl) {
            Image image = new Image();
            image.setProductDetail(productDetail);
            image.setUrl(url);
            this.imageService.handleSaveImage(image);
        }
    }
    private String handleListImage(List<Image> images) {
        String imageUrls = images.stream()
                .map(Image::getUrl)
                .collect(Collectors.joining(","));
        return imageUrls;

    }
    @ModelAttribute("listProduct")
    private List<Product> listProduct(Model model){
        return this.productService.fetchProduct();
    }

    @ModelAttribute("listColor")
    private List<Color> listColor(Model model){
        return this.colorService.fecthAllColor();
    }

    @ModelAttribute("listSize")
    private List<Size> listSize(Model model) {
        return this.sizeService.fetchSize();
    }

    @GetMapping("product-detail")
    public String getPageProductDetail(Model model) {
        model.addAttribute("listProductDetail", this.productDetailService.fetchAllProductDetail());
        model.addAttribute("newProductDetail", new ProductDetail());
        return "admin/product/product-detail";
    }

    @PostMapping("product-detail/create")
    public String handleCreateProductDetail(@ModelAttribute("newProductDetail") @Valid ProductDetail productDetail,
                                            BindingResult bindingResult, Model model,
                                            RedirectAttributes redirectAttributes, @RequestParam("imgFile") MultipartFile[] files) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for(FieldError error : errors) {
            System.out.println("----" + error.getField() + "-----" + error.getDefaultMessage());
            System.out.println(error.getObjectName());
        }
        if(bindingResult.hasErrors()){
            model.addAttribute("listProductDetail", this.productDetailService.fetchAllProductDetail());
            model.addAttribute("messageError", "Create");
            return "admin/product/product-detail";
        }
        if(this.productDetailService.checkProductDetailExisted(productDetail)) {
            model.addAttribute("listProductDetail", this.productDetailService.fetchAllProductDetail());
            model.addAttribute("message", "biến thể sản phẩm đã tồn tại");
            model.addAttribute("messageType", "fail");
            return "admin/product/product-detail";
        }
        productDetail.setCreaedAt(LocalDate.now());
        List<String> listImg = this.uploadService.handleSaveUploadFiles(files, "product");
        this.productDetailService.handleSaveProductDetail(productDetail);
        this.handleSaveImage(productDetail, listImg);
        redirectAttributes.addFlashAttribute("message", "Thêm thành công");
        redirectAttributes.addFlashAttribute("messageType", "success");
        return "redirect:/admin/product-detail";
    }

    @PostMapping("product-detail/update")
    public String handleUpdateProductDetail(@ModelAttribute @Valid ProductDetail newProductDetail,
                                            BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes,
                                            @RequestParam("imgFile") MultipartFile[] files){
        ProductDetail productDetail = this.productDetailService.fetchProductDetailById(newProductDetail.getId());
        if(bindingResult.hasErrors()){
            List<FieldError> errors = bindingResult.getFieldErrors();
            for(FieldError error : errors) {
                if(error.getField().equals("costPrice")) {
                    model.addAttribute("errorCostPrice", "Giá nhập không để trống và phảilớn hơn 0");
                }
                if(error.getField().equals("salePrice")) {
                    model.addAttribute("errorSaletPrice", "Giá bán không để trống và phảilớn hơn 0");
                }
                if(error.getField().equals("quantity")) {
                    model.addAttribute("errorQuantity", "Số lượng không để trống và phải lớn hơn 0");
                }
            }
            model.addAttribute("newProductDetail", new ProductDetail());
            model.addAttribute("listProductDetail", this.productDetailService.fetchAllProductDetail());
            model.addAttribute("listOldImg", handleListImage(this.imageService.fetchImage()));
            model.addAttribute("messageError", "Update");
            return "admin/produc/product-detail";
        }

        if(this.productDetailService.checkProductDetailExisted(productDetail)) {
            model.addAttribute("newProductDetail", new ProductDetail());
            model.addAttribute("listProductDetail", this.productDetailService.fetchAllProductDetail());
            model.addAttribute("message", "biến thể sản phẩm đã tồn tại");
            model.addAttribute("messageType", "fail");
            model.addAttribute("listOldImg", handleListImage(this.imageService.fetchImage()));
            return "admin/product/product-detail";
        }
        productDetail.setProduct(newProductDetail.getProduct());
        productDetail.setColor(newProductDetail.getColor());
        productDetail.setSize(newProductDetail.getSize());
        productDetail.setCostPrice(newProductDetail.getCostPrice());
        productDetail.setSalePrice(newProductDetail.getSalePrice());
        productDetail.setDescription(newProductDetail.getDescription());
        productDetail.setQuantity(newProductDetail.getQuantity());
        this.productDetailService.handleSaveProductDetail(productDetail);
        if(files.length != 0) {
            List<Image> imageList = this.imageService.fetchImageByProductDetail(productDetail);
            String[] oldImage = new String[imageList.size()];
            for(int i = 0; i <oldImage.length; i++) {
                oldImage[i] = imageList.get(i).getUrl();
            }
            this.uploadService.deleteFiles(oldImage, "product");
            List<String> listImg = this.uploadService.handleSaveUploadFiles(files, "product");
            this.handleSaveImage(productDetail, listImg);
        }
        redirectAttributes.addFlashAttribute("message", "Sửa thành công");
        redirectAttributes.addFlashAttribute("messageType", "success");
        return "redirect:/admin/product-detail";
    }
}
