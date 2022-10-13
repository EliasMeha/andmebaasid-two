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
public class LaadimispunktiKategooria {

    @Id
    @Column
    private Integer laadimispunkti_kategooria_kood;

    @Column
    private String laadimispunkti_kategooria_nimetus;

    @Column
    private Integer laadimispunkti_kategooria_tyyp_kood;
}
