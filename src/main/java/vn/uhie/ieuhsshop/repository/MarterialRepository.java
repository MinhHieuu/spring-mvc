package vn.uhie.ieuhsshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.uhie.ieuhsshop.domain.Marterial;

@Repository
public interface MarterialRepository extends JpaRepository<Marterial, Long> {
}
