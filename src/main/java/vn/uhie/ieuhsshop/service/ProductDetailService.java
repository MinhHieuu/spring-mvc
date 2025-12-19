package vn.uhie.ieuhsshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.Product;
import vn.uhie.ieuhsshop.domain.ProductDetail;
import vn.uhie.ieuhsshop.repository.ProductDetailRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ProductDetailService {
    @Autowired
    private ProductDetailRepository productDetailRepository;

    public List<ProductDetail> fetchAllProductDetail() {
        return this.productDetailRepository.findAll();
    }

    public void handleSaveProductDetail(ProductDetail productDetail) {
        this.productDetailRepository.save(productDetail);
    }

    public List<ProductDetail> fetchProductDetailByProduct(Product product) {
        return this.productDetailRepository.getProductDetailByProduct(product);
    }

    public boolean checkProductDetailExisted(ProductDetail productDetail){
        Optional<ProductDetail> detail = this.productDetailRepository.
                getProductDetailByProductAndColorAndSize(
                        productDetail.getProduct(),
                        productDetail.getColor(),
                        productDetail.getSize());
        if(detail.isPresent()) return  true;
        return false;
    }

    public ProductDetail fetchProductDetailById(Long id) {
        Optional<ProductDetail> detail = this.productDetailRepository.findById(id);
        if(detail.isPresent()) {
            return detail.get();
        }
        return null;
    }
}
