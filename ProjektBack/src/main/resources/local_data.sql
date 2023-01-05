SET DATESTYLE TO  DMY;

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (1, 'aktiivne');

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (2, 'mitteaktiivne');

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (0, 'ootel');

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (3, 'lopetatud');

INSERT INTO riik(riik_kood, riik_nimetus)
VALUES ('EST','Eesti');

INSERT INTO tootaja_seisundi_liik(tootaja_seisundi_liik_kood, tootaja_seisundi_liik_nimetus)
VALUES (0, 'tööl');

INSERT INTO isiku_seisundi_liik(isiku_seisundi_liik_kood, isiku_seisundi_liik_nimetus)
VALUES (0, 'elus');

INSERT INTO tootaja_roll(tootaja_roll_kood, kirjeldus, tootaja_roll_nimetus)
 VALUES (0, 'juhatab', 'Juhataja');



INSERT INTO laadimispunkti_tyyp(laadimispunkti_tyyp_kood, laadimispunkti_tyyp_nimetus, kWh)
VALUES (0,'tavaline', 20);

INSERT INTO laadimispunkti_tyyp(laadimispunkti_tyyp_kood, laadimispunkti_tyyp_nimetus, kWh)
VALUES (1, 'kiir',40);

INSERT INTO isik(isikukood, reg_aeg, synni_kp, eesnimi, perenimi, elukoht, e_meil, riik_kood, isiku_seisundi_liik_kood)
VALUES ('1a-b1/1+1', default,  '30-09-1999'::date, 'Peeter', 'Tarvas', 'Afganistaan', 'peetertarvas@gmail.com', 'EST', 0);

INSERT INTO isik(isikukood,reg_aeg,  synni_kp, eesnimi, perenimi, elukoht, e_meil, riik_kood, isiku_seisundi_liik_kood)
VALUES ('11111112',default, '29-09-1999'::date, 'Rahul', 'Kersna', 'Kehra', 'veetertarvas@gmail.com', 'EST', 0);

INSERT INTO isik(isikukood,reg_aeg, synni_kp, eesnimi, elukoht, e_meil, riik_kood, isiku_seisundi_liik_kood)
VALUES ('11111113',default, '29-09-1999'::date, 'Eeter', 'Kehra', 'eetertarvas@gmail.com', 'EST', 0);


INSERT INTO Tootaja(isik_id, tootaja_seisundi_liik_kood)
VALUES (1, 0);

INSERT INTO Tootaja(isik_id, tootaja_seisundi_liik_kood, mentor)
VALUES (2, 0, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood,laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (1, 1.8, 'Esimene', 1.5, default, 1, 1, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (2, 1.2, 'Teine', 1.9, default, 2, 2, 0);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (3 ,12.2, 'Kolmas', 20.1, default, 1, 1, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (4, 12.2, 'Neljas', 15.1, default, 2, 3, 0);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (5, 179.56, 'Viies', 28.1, default, 1, 1, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (6, 66.6, 'Kuues', 66.6, default, 2, 0, 0);

INSERT INTO laadimispunkti_kategooria_tyyp(laadimispunkti_kategooria_tyyp_kood, laadimispunkti_kategooria_tyyp_nimetus)
VALUES (1, 'Laadija Kiirus');

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus, laadimispunkti_kategooria_tyyp_kood)
VALUES (1, 'Kiirlaadija', 1);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus, laadimispunkti_kategooria_tyyp_kood)
VALUES (2, 'Tavalaadija', 1);

INSERT INTO laadimispunkti_kategooria_tyyp(laadimispunkti_kategooria_tyyp_kood, laadimispunkti_kategooria_tyyp_nimetus)
VALUES (2, 'Laadimispesa tüüp');

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus, laadimispunkti_kategooria_tyyp_kood)
VALUES (3, 'Mennekes (type 2)', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus, laadimispunkti_kategooria_tyyp_kood)
VALUES (4, 'CCS2', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus, laadimispunkti_kategooria_tyyp_kood)
VALUES (5, 'CB/T', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus, laadimispunkti_kategooria_tyyp_kood)
VALUES (6, 'CHAdeMO', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus, laadimispunkti_kategooria_tyyp_kood)
VALUES (7, 'J1772 (Type 1)', 2);

INSERT INTO laadimispunkti_kategooria(laadimispunkti_kategooria_kood, laadimispunkti_kategooria_nimetus, laadimispunkti_kategooria_tyyp_kood)
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