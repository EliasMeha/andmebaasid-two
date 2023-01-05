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

COMMENT ON FUNCTION f_registreeri_laadimispunkt IS 'Selle funktsiooniga lisatakse andmebaasi uus laadimispunkt (OP1). Parameetrite väärtused on järgnevad: p_laadimispunkti_kood on identifikaator täisarvuna (integer), p_laiuskraad on laadimispunkti asukoha laiuskraad täpsusega (2, 4), ';

CREATE OR REPLACE FUNCTION f_unusta_laadimispunkt (
p_laadimispunkti_kood laadimispunkt.laadimispunkt_kood%TYPE
) RETURNS integer
LANGUAGE sql security definer
SET search_path=public, pg_temp

BEGIN ATOMIC
DELETE FROM laadimispunkt
WHERE ((laadimispunkt.laadimispunkti_kood = f_unusta_laadimispunkt.p_laadimispunkti_kood) AND (laadimispunkt.laadimispunkti_seisundi_liik_kood = 0))
RETURNING laadimispunkt.laadimispunkti_kood;
END;

COMMENT ON FUNCTION f_unusta_laadimispunkt IS '';

CREATE OR REPLACE FUNCTION f_aktiveeri_laadimispunkt (

)