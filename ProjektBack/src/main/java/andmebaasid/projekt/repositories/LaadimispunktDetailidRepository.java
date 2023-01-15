package andmebaasid.projekt.repositories;

import andmebaasid.projekt.entities.LaadimispunktDetailid;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface LaadimispunktDetailidRepository extends JpaRepository<LaadimispunktDetailid, Integer> {
    @Query("SELECT l FROM LaadimispunktDetailid l WHERE l.laadimispunkti_kood = :kood")
    LaadimispunktDetailid findByLaadimispunktiKood(Long kood);
}
