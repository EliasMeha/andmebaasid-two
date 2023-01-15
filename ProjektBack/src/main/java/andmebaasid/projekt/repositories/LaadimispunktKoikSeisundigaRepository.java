package andmebaasid.projekt.repositories;

import andmebaasid.projekt.entities.LaadimispunktKoikSeisundiga;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LaadimispunktKoikSeisundigaRepository extends JpaRepository<LaadimispunktKoikSeisundiga, Integer> {
}
