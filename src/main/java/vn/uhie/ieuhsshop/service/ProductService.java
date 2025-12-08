package vn.uhie.ieuhsshop.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.Product;
import vn.uhie.ieuhsshop.repository.ProductRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    public List<Product> fetchProduct() {
        return this.productRepository.findAll();
    }

    public void handleSaveProduct(Product product) {
        this.productRepository.save(product);
    }

    public Product fetchProductById(Long id) {
        Optional<Product> product = this.productRepository.findById(id);
        if(product.isPresent()) {
            return product.get();
        }
        return null;
    }
}
