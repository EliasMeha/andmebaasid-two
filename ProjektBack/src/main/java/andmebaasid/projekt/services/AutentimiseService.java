package andmebaasid.projekt.services;

import andmebaasid.projekt.dto.KasutajaDTO;
import andmebaasid.projekt.repositories.IsikRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AutentimiseService {
    @Autowired
    private IsikRepository isikRepository;

    public static KasutajaDTO logIn(KasutajaDTO kasutajaDTO) {
        return null;
    }
}
