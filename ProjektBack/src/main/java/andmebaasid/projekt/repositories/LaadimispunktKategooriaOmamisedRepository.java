package andmebaasid.projekt.repositories;

import andmebaasid.projekt.entities.LaadimispunktKategooriaOmamised;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LaadimispunktKategooriaOmamisedRepository extends JpaRepository<LaadimispunktKategooriaOmamised, Integer> {
}
