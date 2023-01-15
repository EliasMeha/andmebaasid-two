package andmebaasid.projekt.services;

import andmebaasid.projekt.dto.KategooriaDTO;
import andmebaasid.projekt.dto.LaadimispunktLopetatavDTO;
import andmebaasid.projekt.dto.LaadimispunktSeisundigaDTO;
import andmebaasid.projekt.dto.LaadimispunktDTO;
import andmebaasid.projekt.entities.LaadimispunktKategooriaOmamised;
import andmebaasid.projekt.entities.LaadimispunktKoikSeisundiga;
import andmebaasid.projekt.entities.LaadimispunktSaabLopetada;
import andmebaasid.projekt.entities.LaadimispunktDetailid;
import andmebaasid.projekt.repositories.LaadimispunktKategooriaOmamisedRepository;
import andmebaasid.projekt.repositories.LaadimispunktKoikSeisundigaRepository;
import andmebaasid.projekt.repositories.LaadimispunktRepository;
import andmebaasid.projekt.repositories.LaadimispunktSaabLopetadaRepository;
import andmebaasid.projekt.repositories.LaadimispunktDetailidRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class LaadimispunktiService {

    @Autowired
    private LaadimispunktRepository lR;
    @Autowired
    private LaadimispunktKoikSeisundigaRepository lKSR;
    @Autowired
    private LaadimispunktSaabLopetadaRepository lSLR;
    @Autowired
    private LaadimispunktDetailidRepository lDR;
    @Autowired
    private LaadimispunktKategooriaOmamisedRepository lKOR;

    public List<LaadimispunktSeisundigaDTO> getALlLaadimispunkt() {
        List<LaadimispunktSeisundigaDTO> DTOs = new LinkedList<>();
        for (LaadimispunktKoikSeisundiga lKS : lKSR.findAll()) {
            LaadimispunktSeisundigaDTO dTO = new LaadimispunktSeisundigaDTO();
            dTO.setLaadimispunkti_kood(lKS.getLaadimispunkti_kood());
            dTO.setLaadimispunkti_seisundi_liik_nimetus(lKS.getLaadimispunkti_seisundi_liik_nimetus());
            dTO.setLaiuskraad(lKS.getLaiuskraad());
            dTO.setPikkuskraad(lKS.getPikkuskraad());
            dTO.setNimetus(lKS.getLaadimispunkti_nimetus());
            DTOs.add(dTO);
        }
        return DTOs;
    }

    public List<LaadimispunktLopetatavDTO> getALlLopetatavadLaadimispunkt() {
        List<LaadimispunktLopetatavDTO> DTOs = new LinkedList<>();
        for (LaadimispunktSaabLopetada lSL : lSLR.findAll()) {
            LaadimispunktLopetatavDTO dTO = new LaadimispunktLopetatavDTO();
            dTO.setLaadimispunkti_kood(lSL.getLaadimispunkti_kood());
            dTO.setLaadimispunkti_seisundi_liik_nimetus(lSL.getLaadimispunkti_seisundi_liik_nimetus());
            dTO.setLaadimispunkti_seisundi_liik_kood(lSL.getLaadimispunkti_seisundi_liik_kood());
            dTO.setNimetus(lSL.getLaadimispunkti_nimetus());
            DTOs.add(dTO);
        }
        return DTOs;
    }

    public LaadimispunktDTO getLaadimispunktWithId(Long id) {
        LaadimispunktDetailid lD = lDR.findByLaadimispunktiKood(id);
        List<LaadimispunktKategooriaOmamised> lKOL = lKOR.findAll().stream().filter(n -> Objects.equals(n.getLaadimispunkti_kood(), lD.getLaadimispunkti_kood())).collect(Collectors.toList());
        Map<Integer, KategooriaDTO> kategooriad = new LinkedHashMap<>();
        for (LaadimispunktKategooriaOmamised lKO : lKOL) {
            KategooriaDTO kategooriaDTO = new KategooriaDTO();
            kategooriaDTO.setKategooriaNimetus(lKO.getLaadimispunkti_kategooria_nimetus());
            kategooriaDTO.setKategooriaTyypNimetus(lKO.getLaadimispunkti_kategooria_tyyp_nimetus());
            kategooriad.put(lKO.getLaadimispunkti_kategooria_kood(), kategooriaDTO);
        }
        LaadimispunktDTO lDTO = new LaadimispunktDTO();
        lDTO.setLaadimispunkti_kood(lD.getLaadimispunkti_kood());
        lDTO.setNimetus(lD.getLaadimispunkti_nimetus());
        lDTO.setLaiuskraad(lD.getLaiuskraad());
        lDTO.setPikkuskraad(lD.getPikkuskraad());
        lDTO.setReg_aeg(lD.getReg_aeg());
        lDTO.setLaadimispunkti_seisundi_liik_nimetus(lD.getLaadimispunkti_seisundi_liik_nimetus());
        lDTO.setLaadimispunkti_tyyp_nimi(lD.getLaadimispunkti_tyyp_nimetus());
        lDTO.setLaadimispunkti_tyyp_kwh(lD.getKwh().longValue());
        lDTO.setRegistreerija_nimi(lD.getRegistreerija_nimi());
        lDTO.setE_post(lD.getRegistreerija_e_meil());
        lDTO.setKategooriad(kategooriad);
        return lDTO;
    }

    @Transactional
    public void lopetaLaadimispunkt(Long id) {
        /*Integer integer = lR.lopetaLaadimispunkt(id);
        System.out.println(integer);*/
        lR.updateLaadimispunktStatus(id, 4L);
    }
}
