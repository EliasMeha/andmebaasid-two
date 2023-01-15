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
public class LaadimispunktKoondaruanne {
    @Id
    @Column
    private Long laadimispunkti_seisundi_liik_kood;

    @Column
    private String laadimispunkti_seisundi_liik_nimetus;

    @Column
    private Long laadimispunktide_arv;
}
