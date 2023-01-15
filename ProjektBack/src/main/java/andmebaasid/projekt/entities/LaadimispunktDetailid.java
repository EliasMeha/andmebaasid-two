package andmebaasid.projekt.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

@Getter
@Setter
@Entity
@NoArgsConstructor
public class LaadimispunktDetailid {

    @Id
    @Column
    private Long laadimispunkti_kood;

    @Column
    private Double laiuskraad;

    @Column
    private String laadimispunkti_nimetus;

    @Column
    private Double pikkuskraad;

    @Column
    private Date reg_aeg;

    @Column
    private String registreerija_nimi;

    @Column
    private String registreerija_e_meil;

    @Column
    private Integer kwh;

    @Column
    private String laadimispunkti_seisundi_liik_nimetus;

    @Column
    private String laadimispunkti_tyyp_nimetus;
}
