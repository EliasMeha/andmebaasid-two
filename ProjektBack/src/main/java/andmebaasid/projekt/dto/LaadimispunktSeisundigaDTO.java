package andmebaasid.projekt.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class LaadimispunktSeisundigaDTO {
    private Long laadimispunkti_kood;
    private String nimetus;
    private Double laiuskraad;
    private Double pikkuskraad;
    private String laadimispunkti_seisundi_liik_nimetus;
}
