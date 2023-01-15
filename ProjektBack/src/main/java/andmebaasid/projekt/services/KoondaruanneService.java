package andmebaasid.projekt.services;

import andmebaasid.projekt.dto.KoondaruanneDTO;

import andmebaasid.projekt.entities.LaadimispunktKoondaruanne;
import andmebaasid.projekt.repositories.LaadimispunktKoondaruanneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class KoondaruanneService {
    @Autowired
    private LaadimispunktKoondaruanneRepository kR;

    public List<KoondaruanneDTO> getAllKoondaruanne() {
        List<LaadimispunktKoondaruanne> koondaruanded = kR.findAll();
        List<KoondaruanneDTO> koondaruandedDTO = new LinkedList<>();
        for (LaadimispunktKoondaruanne laadimispunktKoondaruanne : koondaruanded) {
            KoondaruanneDTO koondaruanneDTO = new KoondaruanneDTO();
            koondaruanneDTO.setSeisundi_kood(laadimispunktKoondaruanne.getLaadimispunkti_seisundi_liik_kood());
            koondaruanneDTO.setNimetus(laadimispunktKoondaruanne.getLaadimispunkti_seisundi_liik_nimetus());
            koondaruanneDTO.setLaadimispunktide_arv(laadimispunktKoondaruanne.getLaadimispunktide_arv());
            koondaruandedDTO.add(koondaruanneDTO);
        }
        return koondaruandedDTO
                .stream()
                .sorted(Comparator.comparingLong(KoondaruanneDTO::getLaadimispunktide_arv).reversed()
                        .thenComparing(KoondaruanneDTO::getNimetus))
                .collect(Collectors.toList());
    }
}
