package vn.uhie.ieuhsshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.uhie.ieuhsshop.domain.Size;
@Repository
public interface SizeRepository extends JpaRepository<Size, Long> {
}
