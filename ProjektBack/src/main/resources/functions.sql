CREATE OR REPLACE FUNCTION f_registreeri_laadimispunkt(
    p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE,
    p_laiuskraad laadimispunkt.laiuskraad%TYPE,
    p_pikkuskraad laadimispunkt.pikkuskraad%TYPE,
    p_nimetus laadimispunkt.laadimispunkti_nimetus%TYPE,
    p_tootaja_id laadimispunkt.registreerija_id%TYPE,
    p_tyyp_kood laadimispunkt.laadimispunkti_tyyp_kood%TYPE
) RETURNS laadimispunkt.laadimispunkti_kood%TYPE
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path = public, pg_temp

BEGIN
    ATOMIC
    INSERT INTO laadimispunkt (laadimispunkti_kood, laiuskraad, pikkuskraad, laadimispunkti_nimetus,
                               registreerija_id, laadimispunkti_tyyp_kood)
    VALUES (f_registreeri_laadimispunkt.p_laadimispunkti_kood, f_registreeri_laadimispunkt.p_laiuskraad,
            f_registreeri_laadimispunkt.p_pikkuskraad, f_registreeri_laadimispunkt.p_nimetus,
            f_registreeri_laadimispunkt.p_tootaja_id, f_registreeri_laadimispunkt.p_tyyp_kood)
    ON CONFLICT DO NOTHING
    RETURNING laadimispunkt.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_registreeri_laadimispunkt IS 'Selle funktsiooniga lisatakse andmebaasi uus laadimispunkt (OP1). Parameetrite väärtused on järgnevad: p_laadimispunkti_kood on identifikaator täisarvuna (integer), p_laiuskraad on laadimispunkti asukoha laiuskraad täpsusega (7, 4), p_pikkuskraad on laadimispunkti asukoha pikkuskraad täpsusega (6, 4), p_nimetus on laadimispunkti nimi, p_registreerija_id on laadimispunkti registreeria identifikaator, p_tyyp_kood on laadimispunkti tüübi kood.';

CREATE OR REPLACE FUNCTION f_unusta_laadimispunkt(
    p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE
) RETURNS laadimispunkt.laadimispunkti_kood%TYPE
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path = public, pg_temp

BEGIN
    ATOMIC
    DELETE
    FROM laadimispunkt
    WHERE ((laadimispunkt.laadimispunkti_kood = f_unusta_laadimispunkt.p_laadimispunkti_kood))
    RETURNING laadimispunkt.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_unusta_laadimispunkt IS 'Selle funktsiooniga unustatakse laadimispunkt (OP2). Parameetri p_laadimispunkti_kood väärtuseks on selle laadimispunkti kood mida kustutada tahetakse. Kustutada saab seda juhul kui seisund on "ootel" ehk kood on 1.';

CREATE OR REPLACE FUNCTION f_aktiveeri_laadimispunkt(
    p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE
) RETURNS laadimispunkt.laadimispunkti_kood%TYPE
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path = public, pg_temp

BEGIN
    ATOMIC
    UPDATE laadimispunkt AS l
    SET laadimispunkti_seisundi_liik_kood = 2
    WHERE ((l.laadimispunkti_kood = f_aktiveeri_laadimispunkt.p_laadimispunkti_kood))
    RETURNING l.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_aktiveeri_laadimispunkt IS 'Selle funktsiooniga aktiveeritakse laadimispunkt (OP3). Parameetri p_laadimispunkti_kood väärtuseks on selle laadimispunkti kood, mida aktiveerida tahetaks. Aktiveerida saab laadimispunkti, mis omab vähemalt ühte kategooriat ning mille seisund on "Ootel" (kood 1) või "Mitteaktiivne" (kood 3).';

CREATE OR REPLACE FUNCTION f_muuda_laadimispunkt_mitteaktiivseks(
    p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE
) RETURNS laadimispunkt.laadimispunkti_kood%TYPE
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path = public, pg_temp

BEGIN
    ATOMIC
    UPDATE laadimispunkt AS l
    SET laadimispunkti_seisundi_liik_kood = 3
    WHERE ((l.laadimispunkti_kood = f_muuda_laadimispunkt_mitteaktiivseks.p_laadimispunkti_kood))
    RETURNING l.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_muuda_laadimispunkt_mitteaktiivseks IS 'Selle funktsiooniga muudetakse laadimispunkt mitteaktiivseks (OP4). Parameetri p_laadimispunkti_kood väärtuseks on selle laadimispunkti kood, mida mitteaktiivseks muuta tahetakse. Seda operatsiooni saab täita juhul kui laadimispunkti seisund on "Aktiivne" (kood 2).';

CREATE OR REPLACE FUNCTION f_lopeta_laadimispunkt(
    p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE
) RETURNS laadimispunkt.laadimispunkti_kood%TYPE
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path = public, pg_temp

BEGIN
    ATOMIC
    UPDATE laadimispunkt AS l
    SET laadimispunkti_seisundi_liik_kood = 4
    WHERE ((l.laadimispunkti_kood = f_lopeta_laadimispunkt.p_laadimispunkti_kood))
    RETURNING l.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_lopeta_laadimispunkt IS 'Selle funktsiooniga lõpetatakse laadimispunkt (OP5). Parameetri p_laadimispunkti_kood väärtuseks on selle laadimispunkti kood, mida lõpetada soovitakse. Seda operatsiooni saab täita juhul kui laadimispunkti seisund on "aktiivne" või "mitteaktiivne"';

CREATE OR REPLACE FUNCTION f_muuda_laadimispunkt(
    p_laadimispunkti_kood_vana laadimispunkt.laadimispunkti_kood%TYPE,
    p_laadimispunkti_kood_uus laadimispunkt.laadimispunkti_kood%TYPE,
    p_nimetus laadimispunkt.laadimispunkti_nimetus%TYPE,
    p_laiuskraad laadimispunkt.laiuskraad%TYPE,
    p_pikkuskraad laadimispunkt.pikkuskraad%TYPE,
    p_laadimispunkti_tyyp_kood laadimispunkt.laadimispunkti_tyyp_kood%TYPE
) RETURNS laadimispunkt.laadimispunkti_kood%TYPE
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path = public, pg_temp

BEGIN
    ATOMIC
    UPDATE laadimispunkt AS l
    SET laadimispunkti_kood      = f_muuda_laadimispunkt.p_laadimispunkti_kood_uus,
        pikkuskraad              = f_muuda_laadimispunkt.p_pikkuskraad,
        laiuskraad               = f_muuda_laadimispunkt.p_laiuskraad,
        laadimispunkti_nimetus   = f_muuda_laadimispunkt.p_nimetus,
        laadimispunkti_tyyp_kood = f_muuda_laadimispunkt.p_laadimispunkti_tyyp_kood
    WHERE ((l.laadimispunkti_kood = f_muuda_laadimispunkt.p_laadimispunkti_kood_vana) AND
           (l.laadimispunkti_seisundi_liik_kood = 1 OR l.laadimispunkti_seisundi_liik_kood = 3))
    RETURNING l.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_muuda_laadimispunkt IS 'Selle funktsiooniga muudetakse laadimispunkti (OP6). Parameetri p_laadimispunkti_kood_vana on laadimispunkti kood mida muuta tahetakse, p_laadimispunkti_kood_uus väärtuseks on selle laadimispunkti uus kood, p_pikkuskraad on uus pikkuskraad, p_laiuskraad on uus laiuskraad, p_laadimispunkti_tyyp_kood on selle tüübi kood milleks laadimispunkti muuta tahetakse ja p_nimetus on uus nimetus. Seda operatsiooni saab täita juhul kui laadimispunkti seisund on "ootel" või "mitteaktiivne"';

CREATE OR REPLACE FUNCTION f_lisa_laadimispunkt_kategooriasse(
    p_laadimispunkti_kood laadimispunkti_kategooria_omamine.laadimispunkti_kood%TYPE,
    p_laadimispunkti_kategooria_kood laadimispunkti_kategooria_omamine.laadimispunkti_kategooria_kood%TYPE
) RETURNS laadimispunkti_kategooria_omamine.laadimispunkti_kood%TYPE
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path = public, pg_temp

BEGIN
    ATOMIC
    INSERT INTO laadimispunkti_kategooria_omamine AS lko
    SELECT l.laadimispunkti_kood,
           f_lisa_laadimispunkt_kategooriasse.p_laadimispunkti_kategooria_kood AS p_laadimispunkti_kategooria_kood
    FROM laadimispunkt AS l
    WHERE ((l.laadimispunkti_kood = f_lisa_laadimispunkt_kategooriasse.p_laadimispunkti_kood) AND
           (l.laadimispunkti_seisundi_liik_kood = 1 OR l.laadimispunkti_seisundi_liik_kood = 3)) FOR UPDATE OF l
    RETURNING lko.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_lisa_laadimispunkt_kategooriasse IS 'Selle funktsiooniga lisatakse laadimispunkt kategooriasse (OP7). Parameetri p_laadimispunkti_kood väärtuseks on selle laadimispunkti kood, mida kategooriasse lisata tahetakse, p_laadimispunkti_kategooria_kood on selle kategooria kood, kuhu laadimispunkti lisada tahetakse. Seda operatsiooni saab täita juhul kui laadimispunkti seisund on "ootel" või "mitteaktiivne"';

CREATE OR REPLACE FUNCTION f_eemalda_laadimispunkt_kategooriast(
    p_laadimispunkti_kood laadimispunkti_kategooria_omamine.laadimispunkti_kood%TYPE,
    p_laadimispunkti_kategooria_kood laadimispunkti_kategooria_omamine.laadimispunkti_kategooria_kood%TYPE
) RETURNS laadimispunkti_kategooria_omamine.laadimispunkti_kood%TYPE
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path = public, pg_temp

BEGIN
    ATOMIC
    DELETE
    FROM laadimispunkti_kategooria_omamine AS lko
    WHERE ((lko.laadimispunkti_kood = f_eemalda_laadimispunkt_kategooriast.p_laadimispunkti_kood) AND
           (lko.laadimispunkti_kategooria_kood =
            f_eemalda_laadimispunkt_kategooriast.p_laadimispunkti_kategooria_kood) AND
           (f_eemalda_laadimispunkt_kategooriast.p_laadimispunkti_kood IN
            (SELECT l.laadimispunkti_kood
             FROM laadimispunkt AS l
             WHERE ((l.laadimispunkti_kood = f_eemalda_laadimispunkt_kategooriast.p_laadimispunkti_kood) AND
                    (l.laadimispunkti_seisundi_liik_kood = 1 OR
                     l.laadimispunkti_seisundi_liik_kood = 3)) FOR UPDATE OF l)))
    RETURNING lko.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_eemalda_laadimispunkt_kategooriast IS 'Selle funktsiooniga eemaldatakse laadimispunkt kategooriast (OP8). Parameetri p_laadimispunkti_kood väärtuseks on selle laadimispunkti kood, mida kategooriast eemaldada tahetakse, p_laadimispunkti_kategooria_kood on selle kategooria kood, kust laadimispunkti eemaldada tahetakse. Seda operatsiooni saab täita juhul kui laadimispunkti seisund on "ootel" või "mitteaktiivne"';

CREATE OR REPLACE FUNCTION f_kontrolli_kasutaja_saab_sisse_logida(
    p_isik_e_meil isik.e_meil%TYPE,
    p_isik_parool kasutajakonto.parool%TYPE
) RETURNS boolean
    LANGUAGE sql
    SECURITY DEFINER
    SET search_path = public, pg_temp AS

$$
SELECT EXISTS(SELECT null
              FROM kasutajakonto AS k
                       INNER JOIN tootaja_rolli_omamine AS t USING (isik_id)
                       INNER JOIN isik i USING (isik_id)
              WHERE p_isik_e_meil = i.e_meil
                AND t.tootaja_roll_kood = 1
                AND k.parool = laiendused.crypt(p_isik_parool, laiendused.gen_salt('bf', 12))
                AND LOCALTIMESTAMP(0) BETWEEN t.alguse_aeg AND t.lopu_aeg
                AND i.isiku_seisundi_liik_kood = 1)
$$;

COMMENT ON FUNCTION f_kontrolli_kasutaja_saab_sisse_logida IS 'Selle funktsiooniga kontrollitakse kas kasutaja saab rakendusse sisse logida. Kontrollitakse, kas kasutaja parool ja e-meil on õiged, kasutaja on juhataja(ehk kood 1) antud ajahetkel"';
