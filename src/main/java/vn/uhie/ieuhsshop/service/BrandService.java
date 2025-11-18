package vn.uhie.ieuhsshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.Brand;
import vn.uhie.ieuhsshop.repository.BrandRepository;

import java.util.List;
import java.util.Optional;

@Service
public class BrandService {
    @Autowired
    private BrandRepository brandRepository;
     public List<Brand> fecthAllBrand(){
         return this.brandRepository.findAll();
     }

     public Brand fectchBrandById(Long id) {
         Optional<Brand> brand = this.brandRepository.findById(id);
         if(brand.isPresent()) {
             return brand.get();
         }
         return null;
     }

     public Brand fecthBrandByName(String name) {
         Optional<Brand> brand = this.brandRepository.findByName(name);
         if(brand.isPresent()) {
             return brand.get();
         }
         return null;
     }

     public void handleSaveBrand(Brand brand) {
         this.brandRepository.save(brand);
     }
}
