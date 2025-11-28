package vn.uhie.ieuhsshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.uhie.ieuhsshop.domain.Marterial;

import java.util.Optional;

@Repository
public interface MarterialRepository extends JpaRepository<Marterial, Long> {
    Optional<Marterial> fetchMarterialByName(String s);
}
