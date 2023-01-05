CREATE OR REPLACE FUNCTION f_registreeri_laadimispunkt (
p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE,
p_laiuskraad laadimispunkt.laiuskraad%TYPE,
p_pikkuskraad laadimispunkt.pikkuskraad%TYPE,
p_nimetus laadimispunkt.laadimispunkti_nimetus%TYPE,
p_tootaja_id laadimispunkt.registreerija_id%TYPE,
p_tyyp_kood laadimispunkt.laadimispunkti_tyyp_kood%TYPE
) RETURNS laadimispunkt.laadimispunkti_kood%TYPE
LANGUAGE sql SECURITY DEFINER
SET search_path=public, pg_temp

BEGIN ATOMIC
INSERT INTO laadimispunkt (laadimispunkti_kood, laiuskraad, pikkuskraad, laadimispunkti_nimetus,
                                                 reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood,
                                                 laadimispunkti_tyyp_kood)
VALUES (f_registreeri_laadimispunkt.p_laadimispunkti_kood, f_registreeri_laadimispunkt.p_laiuskraad,
        f_registreeri_laadimispunkt.p_pikkuskraad, f_registreeri_laadimispunkt.p_nimetus,
        f_registreeri_laadimispunkt.p_reg_aeg, f_registreeri_laadimispunkt.p_tootaja_id,
        f_registreeri_laadimispunkt.p_seisundi_liik_kood,
        f_registreeri_laadimispunkt.p_tyyp_kood) ON CONFLICT DO NOTHING
RETURNING laadimispunkt.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_registreeri_laadimispunkt IS 'Selle funktsiooniga lisatakse andmebaasi uus laadimispunkt (OP1). Parameetrite väärtused on järgnevad: p_laadimispunkti_kood on identifikaator täisarvuna (integer), p_laiuskraad on laadimispunkti asukoha laiuskraad täpsusega (7, 4), p_pikkuskraad on laadimispunkti asukoha pikkuskraad täpsusega (6, 4), p_nimetus on laadimispunkti nimi, p_registreerija_id on laadimispunkti registreeria identifikaator, p_tyyp_kood on laadimispunkti tüübi kood.';

CREATE OR REPLACE FUNCTION f_unusta_laadimispunkt (
p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE
) RETURNS integer
LANGUAGE sql SECURITY DEFINER
SET search_path=public, pg_temp

BEGIN ATOMIC
DELETE FROM laadimispunkt
WHERE ((laadimispunkt.laadimispunkti_kood = f_unusta_laadimispunkt.p_laadimispunkti_kood) AND (laadimispunkt.laadimispunkti_seisundi_liik_kood = 0))
RETURNING laadimispunkt.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_unusta_laadimispunkt IS 'Selle funktsiooniga unustatakse laadimispunkt (OP2). Parameetri p_laadimispunkti_kood väärtuseks on selle laadimispunkti kood mida kustutada tahetakse. Kustutada saab seda juhul kui seisund on "ootel" ehk kood on 0.';

CREATE OR REPLACE FUNCTION f_aktiveeri_laadimispunkt (
p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE
) RETURNS integer
LANGUAGE sql SECURITY DEFINER
SET search_path=public, pg_temp

BEGIN ATOMIC
UPDATE laadimispunkt AS l SET laadimispunkti_seisundi_liik_kood = 1
WHERE ((l.laadimispunkti_kood = f_aktiveeri_laadimispunkt.p_laadimispunkti_kood)
           AND (EXISTS(
               SELECT * FROM laadimispunkti_kategooria_omamine AS lko
               WHERE (lko.laadimispunkti_kood = f_aktiveeri_laadimispunkt.p_laadimispunkti_kood)))
           AND (l.laadimispunkti_seisundi_liik_kood = 0 OR l.laadimispunkti_seisundi_liik_kood = 2))
RETURNING l.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_aktiveeri_laadimispunkt IS 'Selle funktsiooniga aktiveeritakse laadimispunkt (OP3). Parameetri p_laadimispunkti_kood väärtuseks on selle laadimispunkti kood, mida aktiveerida tahetaks. Aktiveerida saab laadimispunkti, mis omab vähemalt ühte kategooriat ning mille seisund on "Ootel" (kood 0) või "Mitteaktiivne" (kood 2).';

CREATE OR REPLACE FUNCTION f_muuda_laadimispunkt_mitteaktiivseks (
p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE
) RETURNS integer
LANGUAGE sql SECURITY DEFINER
SET search_path=public, pg_temp

BEGIN ATOMIC
UPDATE laadimispunkt AS l SET laadimispunkti_seisundi_liik_kood = 2
WHERE (l.laadimispunkti_kood = f_muuda_laadimispunkt_mitteaktiivseks(.p_laadimispunkti_kood) AND (l.laadimispunkti_seisundi_liik_kood = 1))
RETURNING l.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_muuda_laadimispunkt_mitteaktiivseks IS 'Selle funktsiooniga muudetakse laadimispunkt mitteaktiivseks (OP4). Parameetri p_laadimispunkti_kood väärtuseks on selle laadimispunkti kood, mida mitteaktiivseks muuta tahetakse. Seda operatsiooni saab täita juhul kui laadimispunkti seisund on "Aktiivne" (kood 1).';