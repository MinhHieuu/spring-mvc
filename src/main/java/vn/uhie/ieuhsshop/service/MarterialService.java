package vn.uhie.ieuhsshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.Marterial;
import vn.uhie.ieuhsshop.repository.MarterialRepository;

import java.util.List;
import java.util.Optional;

@Service
public class MarterialService {
    @Autowired
    MarterialRepository marterialRepository;

    public List<Marterial> fetchMarterial() {
        return this.marterialRepository.findAll();
    }

    public void handleSaveMarterial(Marterial marterial) {
        this.marterialRepository.save(marterial);
    }

    public Marterial fetchMarterialByName(String name) {
        Optional<Marterial> marterial = this.marterialRepository.findMarterialByName(name);
        if(marterial.isPresent()) {
            return marterial.get();
        }
        return null;
    }
}
