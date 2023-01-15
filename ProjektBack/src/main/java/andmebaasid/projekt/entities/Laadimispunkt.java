package andmebaasid.projekt.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;
import java.math.BigInteger;
import java.sql.Date;

@Getter
@Setter
@Entity
@NoArgsConstructor
@NamedStoredProcedureQuery(name = "lopetaLaadimispunkt", procedureName = "f_lopeta_laadimispunkt",
        resultClasses = Long.class, parameters = {
        @StoredProcedureParameter(name = "p_laadimispunkti_kood", mode = ParameterMode.IN, type = Long.class)
}
)
public class Laadimispunkt {

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
    private Long registreerija_id;

    @Column
    private Long laadimispunkti_seisundi_liik_kood;

    @Column
    private Long laadimispunkti_tyyp_kood;
}
