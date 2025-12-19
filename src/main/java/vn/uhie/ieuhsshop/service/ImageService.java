package vn.uhie.ieuhsshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.Image;
import vn.uhie.ieuhsshop.domain.ProductDetail;
import vn.uhie.ieuhsshop.repository.ImageRepository;

import java.util.List;

@Service
public class ImageService {
    @Autowired
    private ImageRepository imageRepository;
    public void handleSaveImage(Image image){
        this.imageRepository.save(image);
    }
    public List<Image> fetchImage(){
        return this.imageRepository.findAll();
    }

    public List<Image> fetchImageByProductDetail(ProductDetail productDetail) {
        return this.imageRepository.getImageByProductDetail(productDetail);
    }
}
