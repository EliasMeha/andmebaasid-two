SET DATESTYLE TO DMY;

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (1, 'ootel');

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (2, 'aktiivne');

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (3, 'mitteaktiivne');

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (4, 'lõpetatud');

INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, tootaja_seisundi_liik_nimetus)
VALUES (1, 'tööl');

INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, tootaja_seisundi_liik_nimetus)
VALUES (2, 'puhkusel');

INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, tootaja_seisundi_liik_nimetus)
VALUES (3, 'vallandatud');

INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, tootaja_seisundi_liik_nimetus)
VALUES (4, 'katseajal');

INSERT INTO isiku_seisundi_liik(isiku_seisundi_liik_kood, isiku_seisundi_liik_nimetus)
VALUES (1, 'elus');

INSERT INTO isiku_seisundi_liik(isiku_seisundi_liik_kood, isiku_seisundi_liik_nimetus)
VALUES (2, 'surnud');

INSERT INTO isiku_seisundi_liik(isiku_seisundi_liik_kood, isiku_seisundi_liik_nimetus)
VALUES (3, 'tööl');

INSERT INTO isiku_seisundi_liik(isiku_seisundi_liik_kood, isiku_seisundi_liik_nimetus)
VALUES (4, 'klient');

INSERT INTO kliendi_seisundi_liik(kliendi_seisundi_liik_kood, kliendi_seisundi_liik_nimetus)
VALUES (1, 'aktiivne');

INSERT INTO kliendi_seisundi_liik(kliendi_seisundi_liik_kood, kliendi_seisundi_liik_nimetus)
VALUES (2, 'mitteaktiivne');

INSERT INTO kliendi_seisundi_liik(kliendi_seisundi_liik_kood, kliendi_seisundi_liik_nimetus)
VALUES (3, 'keelatud');

INSERT INTO tootaja_roll(tootaja_roll_kood, kirjeldus, tootaja_roll_nimetus)
VALUES (1, 'juhatab', 'Juhataja');

INSERT INTO tootaja_roll(tootaja_roll_kood, kirjeldus, tootaja_roll_nimetus)
VALUES (2, 'haldab laadimispunkti', 'Laadimispunkti haldur');

INSERT INTO tootaja_roll(tootaja_roll_kood, kirjeldus, tootaja_roll_nimetus)
VALUES (3, 'hooldab laadimispunkti', 'Hooldaja');


INSERT INTO laadimispunkti_tyyp(laadimispunkti_tyyp_kood, laadimispunkti_tyyp_nimetus, kWh)
VALUES (1, 'aeglane', 20);

INSERT INTO laadimispunkti_tyyp(laadimispunkti_tyyp_kood, laadimispunkti_tyyp_nimetus, kWh)
VALUES (2, 'tavaline', 50);

INSERT INTO laadimispunkti_tyyp(laadimispunkti_tyyp_kood, laadimispunkti_tyyp_nimetus, kWh)
VALUES (3, 'kiire', 150);

INSERT INTO laadimispunkti_tyyp(laadimispunkti_tyyp_kood, laadimispunkti_tyyp_nimetus, kWh)
VALUES (4, 'ülikiire', 250);

/* Testandmete laadimine*/


CREATE SCHEMA IF NOT EXISTS laiendused;
/*Loon laienduste jaoks eraldi skeemi.*/

CREATE EXTENSION IF NOT EXISTS postgres_fdw SCHEMA laiendused;
/*Lisan andmebaasi skeemi laiendused väliste andmete pakendamise
laienduse, mis võimaldab PostgreSQL andmebaasis lugeda andmeid
teisest PostgreSQL andmebaasist (võib olla samas serveris või teises serveris) ja neid seal ka muuta (seda viimast pole antud
ülesandes vaja teha).
https://robots.thoughtbot.com/postgres-foreign-data-wrapper
PostgreSQL väliste tabelite mehhanism võimaldab juurdepääsu
erinevat tüüpi failide sisule, aga ka juurdepääsu andmetele, mis
on teistes andmebaasides (võimalik, et teine
andmebaasisüsteem/andmemudel), veebis, infokataloogides jne.
Vaadake PostgreSQL erinevaid väliste andmete pakendajaid:
https://wiki.postgresql.org/wiki/Foreign_data_wrappers */


CREATE SERVER minu_testandmete_server_apex FOREIGN DATA WRAPPER
    postgres_fdw OPTIONS (host 'apex2.ttu.ee', dbname 'testandmed',
    port '5432');
/*Testandmed on apex2.ttu.ee serveris andmebaasis testandmed.
Viite loomine väliste andmete asukohale. Seda lauset pole vaja
muuta!*/

CREATE USER MAPPING FOR t205940 SERVER
    minu_testandmete_server_apex OPTIONS (user 't205940', password
    'V2ga_tyrv4l1ne_innerjoin');
/*Vastavuse defineerimine kohaliku andmebaasi kasutaja ning
selles käskude käivitaja ja välise andmebaasi kasutaja vahel.
Kui teete rühmatööd, siis võite luua ühe sellise vastavuse iga
rühma liikme kohta. Kohaliku ja välise kasutaja nimi langevad
praegu kokku, sest andmebaasid on samas serveris. Siin lauses
kasutage oma apex2.ttu.ee kasutajanime ja parooli!*/

CREATE SCHEMA valine;
/*Panen välised tabelid eraldi skeemi.*/

CREATE FOREIGN TABLE valine.Riik_sisend (
    riik JSONB )
    SERVER minu_testandmete_server_apex OPTIONS (schema_name
    'public', table_name 'riik_jsonb', updatable 'false');
/*Loon skeemis valine välise tabeli, mis viitab välises
andmebaasis skeemis public olevale tabelile riik_jsonb, kus
riikide andmed on JSON formaadis. Lähteandmed pärinevad:
https://gist.github.com/jeremybuis/4997305
psqlis on väliste tabelite nimekirja nägemiseks käsk \det
Välises tabelis ei ole lubatud andmeid muuta – omaduse
updatable väärtus on false.
Milliseid omadusi (options) saab välise tabeli juures määrata
sõltub kasutatavast väliste andmete pakendajast.
*/

SELECT *
FROM valine.Riik_sisend;

INSERT INTO Riik (riik_kood, riik_nimetus)
SELECT riik ->> 'Alpha-3 code'                  AS riik_kood,
       riik ->> 'English short name lower case' AS nimetus
FROM valine.Riik_sisend;
/*Loen välisest tabelist JSON formaadis andmed, teisendan need
sobivale kujule ja laadin enda andmebaasi tabelisse Riik.
Koodinäiteid ja viiteid PostgreSQLis JSON formaadis andmetega
töötamise kohta vaadake slaidikomplektist "Andmebaasisüsteemide
Oracle ja PostgreSQL kasutamine" – otsige sealt sõna JSON.
https://maurus.ttu.ee/download.php?
aine=383&document=36773&tyyp=do
PostgreSQL 14 lisandus võimalus viidata JSON objekti
elementidele kasutades süntaksi, mida saab ka kasutada
massiivide puhul.
https://www.postgresql.org/docs/current/datatypejson.html#JSONB-SUBSCRIPTING

Saan näiteks teha päringu:

SELECT regexp_replace((riik)['Alpha-3
code']::text,'(^"|"$)','','g') AS riik_kood,
regexp_replace((riik)['English short name lower
case']::text,'(^"|"$)','','g') AS nimetus
FROM valine.Riik_sisend;

(riik)['Alpha-3 code'] – eralda jsonb tüüpi väärtusest riik
elemendi 'Alpha-3 code' väärtus. Tulemus on jsonb tüüpi.
(riik)['Alpha-3 code']::text – teisenda väärtus text tüüpi.
regexp_replace((riik)['Alpha-3 code']::text,'(^"|"$)','','g') -
eemalda stringi algusest ja lõpust jutumärgid.*/

SELECT *
FROM Riik;
/*Veendun, et andmed on lisatud.*/
CREATE FOREIGN TABLE valine.Isik_sisend (
    isik JSONB )
    SERVER minu_testandmete_server_apex OPTIONS (schema_name
    'public', table_name 'isik_jsonb', updatable 'false');

SELECT *
FROM valine.Isik_sisend;
/*Sellesse tabelisse andmete genereerimiseks kasutasin:
https://www.json-generator.com/ */

INSERT INTO Isik(riik_kood, isikukood, eesnimi, perenimi,
                 e_meil, synni_kp, isiku_seisundi_liik_kood, elukoht)
SELECT riik_kood,
       isikukood,
       eesnimi,
       perenimi,
       e_meil,
       synni_kp::date,
       isiku_seisundi_liik_kood::smallint,
       elukoht
FROM (SELECT isik ->> 'riik'                                            AS riik_kood,
             jsonb_array_elements(isik -> 'isikud') ->> 'isikukood'     AS isikukood,
             jsonb_array_elements(isik -> 'isikud') ->> 'eesnimi'       AS eesnimi,
             jsonb_array_elements(isik -> 'isikud') ->> 'perekonnanimi' AS
                                                                           perenimi,
             jsonb_array_elements(isik -> 'isikud') ->> 'email'         AS e_meil,
             jsonb_array_elements(isik -> 'isikud') ->> 'synni_aeg'     AS synni_kp,
             jsonb_array_elements(isik -> 'isikud') ->> 'seisund'       AS
                                                                           isiku_seisundi_liik_kood,
             jsonb_array_elements(isik -> 'isikud') ->> 'aadress'       AS elukoht
      FROM valine.Isik_sisend) AS lahteandmed
WHERE isiku_seisundi_liik_kood::smallint = 1;
/*Loen välisest tabelist JSON formaadis andmed, teisendan need
käigult sobivale kujule ja laadin enda andmebaasi tabelisse
Isik. Loen andmeid ainult isikute kohta, kes on seisundis
koodiga 1 e elus.*/

/*Registreerin ühe INSERT lausega kasutajakonto andmed.
Lähteandmetes on ka isikute avatekstilised paroolid (võti
parool). Kannan selle lausega need üle. Kõik kasutajakontod
märgitakse vaikimisi aktiivseks. Iga isik tuleb siduda õige
kasutajakontoga. Isikule antud uue arvulise identifikaatori
leidmiseks, mis läheb tabelisse Kasutajakonto, saab kasutada
lähteandmete hulgas olevaid isiku unikaalseid identifikaatoreid
– meiliaadress või isikukoodi ja riigi kombinatsioon.*/


INSERT INTO kasutajakonto(isik_id, parool)
SELECT isik_id, parool
FROM (SELECT jsonb_array_elements(isik -> 'isikud') ->> 'parool'  AS parool,
             jsonb_array_elements(isik -> 'isikud') ->> 'email'   AS e_meil,
             jsonb_array_elements(isik -> 'isikud') ->> 'seisund' AS isiku_seisundi_liik_kood
      FROM valine.Isik_sisend) AS lahteandmed,
     (SELECT isik_id, e_meil FROM isik) AS isik_andmed
WHERE isiku_seisundi_liik_kood::smallint = 1
  AND lahteandmed.e_meil = isik_andmed.e_meil;

SELECT *
FROM Isik;
/*Veendun, et andmed on lisatud.*/
/*
NB! Alternatiiviks väliste tabelite ükshaaval loomisele on
välise skeemi importimine. skeemi_nimi asemele tuleb kirjutada
skeemi nimi kohalikus andmebaasis, kus soovitakse välised
tabelid luua. Importimisel saab määrata, et soovitakse kõiki
skeemi tabeleid, soovitakse mingeid kindlaid tabeleid või
soovitakse kõiki tabeleid, v.a. mingid kindlad tabelid.
IMPORT FOREIGN SCHEMA public LIMIT TO (riik_jsonb, isik_jsonb)
FROM SERVER minu_testandmete_server_apex INTO skeemi_nimi;
*/


INSERT INTO Tootaja(isik_id, tootaja_seisundi_liik_kood)
VALUES (1, 1);

INSERT INTO Tootaja(isik_id, tootaja_seisundi_liik_kood, mentor)
VALUES (2, 2, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg,
                          registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (1, 1.8, 'Esimene', 1.5, default, 1, 2, 2);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg,
                          registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (2, 1.2, 'Teine', 1.9, default, 2, 3, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg,
                          registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (3, 12.2, 'Kolmas', 20.1, default, 1, 2, 2);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg,
                          registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (4, 12.2, 'Neljas', 15.1, '29-09-2012'::date, 2, 4, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg,
                          registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (5, 179.56, 'Viies', 28.1, default, 1, 2, 2);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg,
                          registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (6, 66.6, 'Kuues', 66.6, default, 2, 3, 4);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg,
                          registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (7, 41.8, 'Whaaat', 61.5, default, 1, 1, 2);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg,
                          registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (8, 71.2, 'Zenzen', 71.9, default, 2, 1, 1);

INSERT INTO laadimispunkti_kategooria_tyyp(laadimispunkti_kategooria_tyyp_kood, laadimispunkti_kategooria_tyyp_nimetus)
VALUES (1, 'Laadija Kiirus');

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus,
                                      laadimispunkti_kategooria_tyyp_kood)
VALUES (1, 'Kiirlaadija', 1);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus,
                                      laadimispunkti_kategooria_tyyp_kood)
VALUES (2, 'Tavalaadija', 1);

INSERT INTO laadimispunkti_kategooria_tyyp(laadimispunkti_kategooria_tyyp_kood, laadimispunkti_kategooria_tyyp_nimetus)
VALUES (2, 'Laadimispesa tüüp');

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus,
                                      laadimispunkti_kategooria_tyyp_kood)
VALUES (3, 'Mennekes (type 2)', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus,
                                      laadimispunkti_kategooria_tyyp_kood)
VALUES (4, 'CCS2', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus,
                                      laadimispunkti_kategooria_tyyp_kood)
VALUES (5, 'CB/T', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus,
                                      laadimispunkti_kategooria_tyyp_kood)
VALUES (6, 'CHAdeMO', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus,
                                      laadimispunkti_kategooria_tyyp_kood)
VALUES (7, 'J1772 (Type 1)', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus,
                                      laadimispunkti_kategooria_tyyp_kood)
VALUES (8, 'CCS1', 2);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (1, 1);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (1, 2);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (1, 3);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (1, 6);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (2, 2);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (2, 3);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (2, 4);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (3, 1);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (4, 5);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (5, 2);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (5, 5);

INSERT INTO laadimispunkti_kategooria_omamine(laadimispunkti_kood, laadimispunkti_kategooria_kood)
VALUES (6, 1);

INSERT INTO klient(isik_id)
VALUES (2);

INSERT INTO tootaja_rolli_omamine(isik_id, tootaja_roll_kood)
VALUES (1, 1);