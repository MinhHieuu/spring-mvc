package vn.uhie.ieuhsshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.Brand;
import vn.uhie.ieuhsshop.domain.Color;
import vn.uhie.ieuhsshop.repository.BrandRepository;
import vn.uhie.ieuhsshop.repository.ColorRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ColorService {
    @Autowired
    private ColorRepository colorRepository;
    public List<Color> fecthAllColor(){
        return this.colorRepository.findAll();
    }


    public Color fecthColorByName(String name) {
        Optional<Color> color = this.colorRepository.fetchColorByName(name);
        if(color.isPresent()) {
            return color.get();
        }
        return null;
    }

    public void handleSaveColor(Color color) {
        this.colorRepository.save(color);
    }
}
