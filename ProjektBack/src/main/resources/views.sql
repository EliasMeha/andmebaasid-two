CREATE OR REPLACE VIEW laadimispunkt_koondaruanne
            WITH (
            security_barrier=true
            )
AS
SELECT s.laadimispunkti_seisundi_liik_kood,
       UPPER(s.laadimispunkti_seisundi_liik_nimetus) AS laadimispunkti_seisundi_liik_nimetus,
       count(l.laadimispunkti_kood)                  AS laadimispunktide_arv
FROM laadimispunkt AS l
         RIGHT JOIN laadimispunkti_seisundi_liik AS s USING (laadimispunkti_seisundi_liik_kood)
GROUP BY s.laadimispunkti_seisundi_liik_kood
ORDER BY count(l.laadimispunkti_kood) DESC, s.laadimispunkti_seisundi_liik_kood;

COMMENT ON VIEW laadimispunkt_koondaruanne IS 'Vaade leiab kõikide laadimispunkti seisundite kohta vastavas seisundis olevad laadimispunktid. Vaade kuvab mitu laadimispunkti iga seisundi kohta on';

CREATE OR REPLACE VIEW laadimispunkt_koik_seisundiga
            WITH (
            security_barrier=true
            )
AS
SELECT l.laadimispunkti_kood,
       l.laadimispunkti_nimetus,
       l.pikkuskraad,
       l.laiuskraad,
       lsl.laadimispunkti_seisundi_liik_nimetus
FROM Laadimispunkt AS l
         INNER JOIN laadimispunkti_seisundi_liik AS lsl USING (laadimispunkti_seisundi_liik_kood);

COMMENT ON VIEW laadimispunkt_koik_seisundiga IS 'Vaade leiab kõik laadimispunktid, et kasutaja saaks vaadata nimekirja kõigist laadimispunktidest.';

CREATE OR REPLACE VIEW laadimispunkt_detailid
            WITH (
            security_barrier=true
            )
AS
SELECT l.laadimispunkti_kood,
       l.laadimispunkti_nimetus,
       l.laiuskraad,
       l.pikkuskraad,
       l.reg_aeg,
       lsl.laadimispunkti_seisundi_liik_nimetus,
       lt.laadimispunkti_tyyp_nimetus,
       lt.kwh,
       trim(concat(i.eesnimi, ' ', i.perenimi)) AS registreerija_nimi,
       i.e_meil                                 as registreerija_e_meil
FROM Laadimispunkt AS l
         INNER JOIN laadimispunkti_seisundi_liik AS lsl USING (laadimispunkti_seisundi_liik_kood)
         INNER JOIN laadimispunkti_tyyp AS lt USING (laadimispunkti_tyyp_kood)
         INNER JOIN isik AS i ON l.registreerija_id = i.isik_id;

COMMENT ON VIEW laadimispunkt_detailid IS 'Vaade leiab laadimispunkti detailid, et tagada kasutajale parem ülevaade laadimispunktist. Näha on laadimispunkti asukoht, laadimispunkti omadused, ja mõnda muud infot.';

CREATE OR REPLACE VIEW laadimispunkt_kategooria_omamised
            WITH (
            security_barrier=true
            )
AS
SELECT lkt.laadimispunkti_kategooria_tyyp_nimetus,
       lk.laadimispunkti_kategooria_nimetus,
       lk.laadimispunkti_kategooria_kood,
       lko.laadimispunkti_kood
FROM laadimispunkti_kategooria_tyyp AS lkt
         INNER JOIN laadimispunkti_kategooria AS lk USING (laadimispunkti_kategooria_tyyp_kood)
         INNER JOIN laadimispunkti_kategooria_omamine AS lko USING (laadimispunkti_kategooria_kood);

COMMENT ON VIEW laadimispunkt_kategooria_omamised IS 'Vaade leiab kõik laadimispunktiga seotud kategooriad. See vaade on ka kasulik selleks, et laadimispunktist paremat ülevaadet saada.';

CREATE OR REPLACE VIEW laadimispunkt_saab_lopetada
            WITH (
            security_barrier=true
            )
AS
SELECT l.laadimispunkti_kood,
       l.laadimispunkti_nimetus,
       l.laadimispunkti_seisundi_liik_kood,
       lsk.laadimispunkti_seisundi_liik_nimetus
FROM laadimispunkt AS l
         INNER JOIN laadimispunkti_seisundi_liik AS lsk USING (laadimispunkti_seisundi_liik_kood)
WHERE l.laadimispunkti_seisundi_liik_kood = 3
   OR l.laadimispunkti_seisundi_liik_kood = 2;

COMMENT ON VIEW laadimispunkt_saab_lopetada IS 'Vaade leiab kõik laadimispunktid, mida on võimalik lõpetada. See vaade on vajalik, et juhatajal oleks ülevaade laadimispuntkidest, mida on võimalik lõpetada.'
