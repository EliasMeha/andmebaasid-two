package andmebaasid.projekt.repositories;

import andmebaasid.projekt.entities.LaadimispunktSaabLopetada;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LaadimispunktSaabLopetadaRepository extends JpaRepository<LaadimispunktSaabLopetada, Integer> {
}
