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
public class Kasutajakonto {
    @Id
    @Column
    private Long isik_id;

    @Column
    private String parool;

    @Column
    private Boolean on_aktiivne;
}
