package vn.uhie.ieuhsshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.Color;
import vn.uhie.ieuhsshop.domain.Size;
import vn.uhie.ieuhsshop.repository.SizeRepository;

import java.util.List;
import java.util.Optional;

@Service
public class SizeService {
    @Autowired
    private SizeRepository sizeRepository;
    public List<Size> fetchSize(){
        return this.sizeRepository.findAll();
    }


    public Size fecthSizeByName(String name) {
        Optional<Size> size = this.sizeRepository.fetchSizeByName(name);
        if(size.isPresent()) {
            return size.get();
        }
        return null;
    }

    public void handleSaveSize(Size size) {
        this.sizeRepository.save(size);
    }
}
