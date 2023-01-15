package andmebaasid.projekt.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Getter
@Setter
@Entity
@NoArgsConstructor
public class LaadimispunktKoikSeisundiga {

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
    private String laadimispunkti_seisundi_liik_nimetus;
}
