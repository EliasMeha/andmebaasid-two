SET DATESTYLE TO  DMY;

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (1, 'ootel');

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (2, 'aktiivne');

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (3, 'mitteaktiivne');

INSERT INTO laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood, laadimispunkti_seisundi_liik_nimetus)
VALUES (4, 'lopetatud');

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
VALUES (1,'aeglane', 20);

INSERT INTO laadimispunkti_tyyp(laadimispunkti_tyyp_kood, laadimispunkti_tyyp_nimetus, kWh)
VALUES (2, 'tavaline', 50);

INSERT INTO laadimispunkti_tyyp(laadimispunkti_tyyp_kood, laadimispunkti_tyyp_nimetus, kWh)
VALUES (3, 'kiire', 150);

INSERT INTO laadimispunkti_tyyp(laadimispunkti_tyyp_kood, laadimispunkti_tyyp_nimetus, kWh)
VALUES (4, 'ülikiire', 250);
