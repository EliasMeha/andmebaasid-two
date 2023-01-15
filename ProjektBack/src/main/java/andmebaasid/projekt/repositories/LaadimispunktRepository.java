package andmebaasid.projekt.repositories;

import andmebaasid.projekt.entities.Laadimispunkt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.TransactionScoped;
import javax.transaction.Transactional;

@Repository
public interface LaadimispunktRepository extends JpaRepository<Laadimispunkt, Integer> {

    @Modifying
    @Query("UPDATE Laadimispunkt l SET l.laadimispunkti_seisundi_liik_kood=:seisundi_liik WHERE l.laadimispunkti_kood=:id")
    void updateLaadimispunktStatus(Long id, Long seisundi_liik);


    @Procedure(name="lopetaLaadimispunkt")
    Integer lopetaLaadimispunkt(@Param("p_laadimispunkti_kood") Long p_laadimispunkti_kood);

}
