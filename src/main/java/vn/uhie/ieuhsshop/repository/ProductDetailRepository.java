package vn.uhie.ieuhsshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.uhie.ieuhsshop.domain.Color;
import vn.uhie.ieuhsshop.domain.Product;
import vn.uhie.ieuhsshop.domain.ProductDetail;
import vn.uhie.ieuhsshop.domain.Size;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductDetailRepository extends JpaRepository<ProductDetail, Long> {
    List<ProductDetail> getProductDetailByProduct(Product  product);
    Optional<ProductDetail> getProductDetailByProductAndColorAndSize(Product product, Color color, Size size);
}
