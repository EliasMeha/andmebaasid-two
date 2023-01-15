package andmebaasid.projekt.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Getter
@Setter
@Entity
@NoArgsConstructor
@IdClass(PrimaryKey.class)
public class LaadimispunktKategooriaOmamised {

    @Id
    @Column
    private Long laadimispunkti_kood;

    @Column
    private String laadimispunkti_kategooria_tyyp_nimetus;

    @Column
    private String laadimispunkti_kategooria_nimetus;

    @Id
    @Column
    private Integer laadimispunkti_kategooria_kood;

    @Override
    public String toString() {
        return "LaadimispunktKategooriaOmamised{" +
                "laadimispunkti_kood=" + laadimispunkti_kood +
                ", laadimispunkti_kategooria_tyyp_nimetus='" + laadimispunkti_kategooria_tyyp_nimetus + '\'' +
                ", laadimispunkti_kategooria_nimetus='" + laadimispunkti_kategooria_nimetus + '\'' +
                ", laadimispunkti_kategooria_kood=" + laadimispunkti_kategooria_kood +
                '}';
    }
}
