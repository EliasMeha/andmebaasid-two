package andmebaasid.projekt.repositories;

import andmebaasid.projekt.entities.LaadimispunktKoondaruanne;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LaadimispunktKoondaruanneRepository extends JpaRepository<LaadimispunktKoondaruanne, Integer> {

}
