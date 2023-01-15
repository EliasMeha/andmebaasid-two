package andmebaasid.projekt.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class LaadimispunktLopetatavDTO {
    private Long laadimispunkti_kood;
    private String nimetus;
    private Long laadimispunkti_seisundi_liik_kood;
    private String laadimispunkti_seisundi_liik_nimetus;
}
