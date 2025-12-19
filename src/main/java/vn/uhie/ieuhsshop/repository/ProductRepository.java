package vn.uhie.ieuhsshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.uhie.ieuhsshop.domain.Brand;
import vn.uhie.ieuhsshop.domain.Category;
import vn.uhie.ieuhsshop.domain.Marterial;
import vn.uhie.ieuhsshop.domain.Product;

import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Optional<Product> getProductByName(String name);
    Optional<Product> getProductByNameAndBrandAndCategoryAndMarterial(String name, Brand brand, Category category, Marterial marterial);
}
