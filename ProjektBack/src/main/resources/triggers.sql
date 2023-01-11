CREATE OR REPLACE FUNCTION f_muuda_laadimispunkti_seisundi_liiki()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
RAISE EXCEPTION 'Laadimispunkti ebakorrektne seisundimuudatus';
END;
$BODY$;

COMMENT ON FUNCTION f_muuda_laadimispunkti_seisundi_liiki() IS 'Antud funktsioon jooksutatakse trigeri poolt, mis kontrollib, kas seisundiliigi muudatud on võimalik. Funktsioon jooksutatakse juhul kui see pole võimalik ja funktsioon tõstatab errori.';

CREATE OR REPLACE TRIGGER on_lubatud_seisundimuudatus_ootel
    BEFORE UPDATE OF laadimispunkti_seisundi_liik_kood ON laadimispunkt
    FOR EACH ROW
    WHEN (NOT ((old.laadimispunkti_seisundi_liik_kood = 1 AND new.laadimispunkti_seisundi_liik_kood = 2)
                   OR (old.laadimispunkti_seisundi_liik_kood = new.laadimispunkti_seisundi_liik_kood)
                   OR (old.laadimispunkti_seisundi_liik_kood = 2 AND new.laadimispunkti_seisundi_liik_kood = 3)
                   OR (old.laadimispunkti_seisundi_liik_kood = 3 AND new.laadimispunkti_seisundi_liik_kood = 2)
                   OR (old.laadimispunkti_seisundi_liik_kood = 2 AND new.laadimispunkti_seisundi_liik_kood = 4)
                   OR (old.laadimispunkti_seisundi_liik_kood = 3 AND new.laadimispunkti_seisundi_liik_kood = 4)))
    EXECUTE FUNCTION f_muuda_laadimispunkti_seisundi_liiki();

COMMENT ON TRIGGER on_lubatud_seisundimuudatus_ootel ON laadimispunkt IS 'Trigger kontrollib kas seisundiliigi muudatus on lubatud. Triger kontrollib kas vanast seisundi liigi koodist on võimalik minna uuele, juhul kui see pole võimalik käivitatakse trigeri funktsioon.';
