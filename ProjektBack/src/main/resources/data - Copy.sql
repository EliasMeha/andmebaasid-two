INSERT INTO Tootaja(isik_id, tootaja_seisundi_liik_kood)
VALUES (1, 1);

INSERT INTO Tootaja(isik_id, tootaja_seisundi_liik_kood, mentor)
VALUES (2, 2, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood,laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (1, 1.8, 'Esimene', 1.5, default, 1, 2, 2);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (2, 1.2, 'Teine', 1.9, default, 2, 3, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (3 ,12.2, 'Kolmas', 20.1, default, 1, 2, 2);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (4, 12.2, 'Neljas', 15.1, '29-09-2012'::date, 2, 4, 1);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (5, 179.56, 'Viies', 28.1, default, 1, 2, 2);

INSERT INTO laadimispunkt(laadimispunkti_kood, laiuskraad, laadimispunkti_nimetus, pikkuskraad, reg_aeg, registreerija_id, laadimispunkti_seisundi_liik_kood, laadimispunkti_tyyp_kood)
VALUES (6, 66.6, 'Kuues', 66.6, default, 2, 1, 4);

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

INSERT INTO kasutajakonto(isik_id, parool)
VALUES (3, 'heaparool_12');

INSERT INTO kasutajakonto(isik_id, parool)
VALUES (2, 'heaparoabsdc');

INSERT INTO kasutajakonto(isik_id, parool, on_aktiivne)
VALUES (1, 'heapool_12', false);

INSERT INTO klient(isik_id)
VALUES (2);

INSERT INTO tootaja_rolli_omamine(isik_id, tootaja_roll_kood)
VALUES (1, 1);
