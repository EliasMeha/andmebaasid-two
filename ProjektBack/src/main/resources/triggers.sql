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

CREATE OR REPLACE TRIGGER trig_laadimispunkt_on_lubatud_seisundimuudatus
    BEFORE UPDATE OF laadimispunkti_seisundi_liik_kood ON laadimispunkt
    FOR EACH ROW
    WHEN (NOT ((old.laadimispunkti_seisundi_liik_kood = 1 AND new.laadimispunkti_seisundi_liik_kood = 2)
                   OR (old.laadimispunkti_seisundi_liik_kood = new.laadimispunkti_seisundi_liik_kood)
                   OR (old.laadimispunkti_seisundi_liik_kood = 2 AND new.laadimispunkti_seisundi_liik_kood = 3)
                   OR (old.laadimispunkti_seisundi_liik_kood = 3 AND new.laadimispunkti_seisundi_liik_kood = 2)
                   OR (old.laadimispunkti_seisundi_liik_kood = 2 AND new.laadimispunkti_seisundi_liik_kood = 4)
                   OR (old.laadimispunkti_seisundi_liik_kood = 3 AND new.laadimispunkti_seisundi_liik_kood = 4)))
    EXECUTE FUNCTION f_muuda_laadimispunkti_seisundi_liiki();

COMMENT ON TRIGGER trig_laadimispunkt_on_lubatud_seisundimuudatus ON laadimispunkt IS 'Trigger kontrollib kas seisundiliigi muudatus on lubatud. Triger kontrollib kas vanast seisundi liigi koodist on võimalik minna uuele, juhul kui see pole võimalik käivitatakse trigeri funktsioon.';

CREATE OR REPLACE FUNCTION f_laadimispunkt_kuulub_kategooriasse()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    IF (EXISTS(
                SELECT *
                FROM laadimispunkti_kategooria_omamine AS lko
                WHERE (lko.laadimispunkti_kood =
                       new.p_laadimispunkti_kood) FOR UPDATE OF lko)) THEN
                           RAISE EXCEPTION 'Laadimispunkt peab kuuluma vähemalt ühte kategooriasse.';
    END IF;
END;
$BODY$;

COMMENT ON FUNCTION f_laadimispunkt_kuulub_kategooriasse() IS 'Antud funktsioon jooksutatakse trigeri poolt, mis kontrollib, kas laadimispuntkil on vähemalt üks kategooria. Funktsioon jooksutatakse juhul laadimispunktil pole ühtegi kategooriat ja funktsioon tõstatab errori.';

CREATE OR REPLACE TRIGGER trig_laadimispunkt_kuulub_kategooriasse
    BEFORE UPDATE OF laadimispunkti_seisundi_liik_kood ON laadimispunkt
    FOR EACH ROW
    EXECUTE FUNCTION f_laadimispunkt_kuulub_kategooriasse();

COMMENT ON TRIGGER trig_laadimispunkt_on_lubatud_seisundimuudatus ON laadimispunkt IS 'Trigger kontrollib kas antudlaadimispunktil on vähemalt üks kategooria, juhul kui seda pole, käivitatakse trigeri funktsioon.';

CREATE OR REPLACE FUNCTION f_trig_uus_laadimispunkt()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS
$BODY$
BEGIN
    RAISE EXCEPTION 'Laadimispunkti seisundit luuakse vales seisundis. Luua saab ainult ootel laadimispunkte.';
END;
$BODY$;

COMMENT ON FUNCTION f_trig_uus_laadimispunkt() IS 'Funktsioon jooksutatakse triggeri poolt, mis kontrollib kas lisatava laadimispunkti seisund on õige. Kui ei ole siis jooksutab trigger selle funktsiooni ning tagastab exceptioni.';

CREATE
OR
REPLACE
TRIGGER trig_uus_laadimispunkt
    BEFORE
INSERT
ON laadimispunkt
    FOR EACH ROW
    WHEN (NOT new.laadimispunkti_seisundi_liik_kood = 1)
EXECUTE FUNCTION f_trig_uus_laadimispunkt();

COMMENT ON TRIGGER trig_uus_laadimispunkt ON laadimispunkt IS 'Trigger kontrollib, kas uuel lisataval laadimispunktil on õige seisundi liigi kood. Lisada saab ainult "ootel" laadimispunkte.';

CREATE OR REPLACE FUNCTION f_trig_unusta_laadimispunkt()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS
$BODY$
BEGIN
    RAISE EXCEPTION 'Laadimispunkti ei saa unustada. Unustada saab ainult ootel laadimispunkte, see laadimispunkt on muus seisundis.';
END;
$BODY$;

COMMENT ON FUNCTION f_trig_unusta_laadimispunkt() IS 'Funktsioon jooksutatakse triggeri poolt, mis kontrollib kas unustatava/kustutatava laadimispunkti seisund on õige. Kui ei ole siis jooksutab trigger selle funktsiooni ning tagastab exceptioni.';

CREATE
OR
REPLACE
TRIGGER trig_unusta_laadimispunkt
    BEFORE
DELETE
ON laadimispunkt
    FOR EACH ROW
    WHEN (NOT old.laadimispunkti_seisundi_liik_kood = 1)
EXECUTE FUNCTION f_trig_unusta_laadimispunkt();

COMMENT ON TRIGGER trig_unusta_laadimispunkt ON laadimispunkt IS 'Trigger kontrollib, kas kustutataval laadimispunktil on õige seisundi liigi kood. Kustudada saab ainult "ootel" laadimispunkte.';
