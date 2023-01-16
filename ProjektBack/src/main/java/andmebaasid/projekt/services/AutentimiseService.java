package andmebaasid.projekt.services;

import andmebaasid.projekt.dto.KasutajaDTO;
import andmebaasid.projekt.repositories.IsikRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;

@Service
public class AutentimiseService {

    @Autowired
    private EntityManager em;

    @Transactional
    public boolean logiSisse(String e_meil, String parool) {
        StoredProcedureQuery sp = em.createStoredProcedureQuery("f_kontrolli_juhataja_saab_sisse_logida");
        sp.registerStoredProcedureParameter("p_isik_e_meil", String.class, ParameterMode.IN);
        sp.registerStoredProcedureParameter("p_isik_parool", String.class, ParameterMode.IN);
        sp.registerStoredProcedureParameter("p_saab_logida", boolean.class, ParameterMode.OUT);
        sp.setParameter("p_isik_e_meil", e_meil);
        sp.setParameter("p_isik_parool", parool);
        sp.execute();
        return (boolean) sp.getOutputParameterValue("p_saab_logida");
        // return sp.getParameter("p_saab_logida");
    }
}
