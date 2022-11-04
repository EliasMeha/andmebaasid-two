/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 09-apr-2022 12:32:54 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */


/* Drop Tables */

DROP TABLE IF EXISTS Riik  CASCADE
;

DROP TABLE IF EXISTS Tootaja_roll  CASCADE
;

DROP TABLE IF EXISTS Tootaja_seisundi_liik CASCADE
;

DROP TABLE IF EXISTS Laadimispunkti_seisundi_liik CASCADE
;

DROP TABLE IF EXISTS Laadimispunkti_kategooria_tyyp CASCADE
;

DROP TABLE IF EXISTS Kliendi_seisundi_liik CASCADE
;

DROP TABLE IF EXISTS Isiku_seisundi_liik CASCADE
;

DROP TABLE IF EXISTS Laadimispunkti_tyyp CASCADE
;

DROP TABLE IF EXISTS Laadimispunkti_kategooria CASCADE
;

DROP TABLE IF EXISTS Isik CASCADE
;

DROP TABLE IF EXISTS Kasutajakonto CASCADE
;

DROP TABLE IF EXISTS Tootaja CASCADE
;

DROP TABLE IF EXISTS Laadimispunkt CASCADE
;

DROP TABLE IF EXISTS Klient CASCADE
;

DROP TABLE IF EXISTS Laadimispunkti_kategooria_omamine CASCADE
;

DROP TABLE IF EXISTS Tootaja_rolli_omamine CASCADE
;

DROP DOMAIN IF EXISTS aeg CASCADE;

DROP DOMAIN IF EXISTS nimetus CASCADE;


CREATE DOMAIN aeg AS TIMESTAMP(0)WITHOUT TIME ZONE NOT NULL CONSTRAINT CHK_aeg_on_maaratud_ajavahemikus CHECK ( (VALUE BETWEEN To_Timestamp('01-01-2010 00:00:00', 'DD-MM-YYYY HH24:MI:SS')
    AND To_Timestamp('31.12.2100 23:59:59', 'DD-MM-YYYY HH24:MI:SS')) OR VALUE = ('infinity'::timestamp without time zone));

CREATE DOMAIN nimetus AS varchar(50) NOT NULL CONSTRAINT CHK_nimetus_ei_ole_tyhi_string CHECK ( VALUE !~ '^[[:space:]]*$');

/* Create Tables */

CREATE TABLE  Riik
(
	 riik_kood varchar(3) NOT NULL,
	 riik_nimetus nimetus,
	 CONSTRAINT PK_Riik PRIMARY KEY ( riik_kood ),
	 CONSTRAINT AK_Riik_nimetus UNIQUE(riik_nimetus),
	 CONSTRAINT CHK_Riik_Riik_kood_on_oige CHECK ( riik_kood ~ '^[A-Z]{3}$')
)
;

CREATE TABLE  Tootaja_roll
(
    tootaja_roll_kood smallint NOT NULL,
    kirjeldus TEXT,
	tootaja_roll_nimetus nimetus,
	CONSTRAINT PK_Tootaja_roll PRIMARY KEY ( tootaja_roll_kood ),
	CONSTRAINT AK_Tootaja_roll_nimetus UNIQUE(tootaja_roll_nimetus),
    CONSTRAINT CHK_Tootaja_roll_kirjeldus_ei_ole_tyhi_string CHECK ( kirjeldus !~ '^[[:space:]]*$')
)
;

CREATE TABLE  Tootaja_seisundi_liik
(
	tootaja_seisundi_liik_kood smallint  NOT NULL,
	tootaja_seisundi_liik_nimetus nimetus,
	CONSTRAINT PK_Tootaja_seisundi_liik PRIMARY KEY ( tootaja_seisundi_liik_kood )
)
;

CREATE TABLE  Laadimispunkti_seisundi_liik
(
	laadimispunkti_seisundi_liik_kood smallint NOT NULL,
	laadimispunkti_seisundi_liik_nimetus nimetus,
	CONSTRAINT PK_Laadimispunkti_seisundi_liik PRIMARY KEY ( laadimispunkti_seisundi_liik_kood ),
    CONSTRAINT AK_laadimispunkti_seisundi_liik_nimetus UNIQUE(laadimispunkti_seisundi_liik_nimetus)
)
;

CREATE TABLE  Laadimispunkti_kategooria_tyyp
(
	laadimispunkti_kategooria_tyyp_kood smallint NOT NULL,
	laadimispunkti_kategooria_tyyp_nimetus nimetus,
	CONSTRAINT PK_Laadimispunkti_kategooria_tyyp PRIMARY KEY ( laadimispunkti_kategooria_tyyp_kood ),
    CONSTRAINT AK_Laadimispunkti_kategooria_tyyp_nimetus UNIQUE(laadimispunkti_kategooria_tyyp_nimetus)
)
;

CREATE TABLE  Kliendi_seisundi_liik
(
	kliendi_seisundi_liik_kood smallint NOT NULL,
	kliendi_seisundi_liik_nimetus nimetus,
	CONSTRAINT  PK_Kliendi_seisundi_liik  PRIMARY KEY ( kliendi_seisundi_liik_kood ),
    CONSTRAINT AK_Kliendi_seisundi_liik_nimetus UNIQUE(kliendi_seisundi_liik_nimetus)
)
;

CREATE TABLE  Isiku_seisundi_liik
(
	isiku_seisundi_liik_kood smallint NOT NULL,
	isiku_seisundi_liik_nimetus nimetus,
	CONSTRAINT PK_Isiku_seisundi_liik PRIMARY KEY ( isiku_seisundi_liik_kood ),
    CONSTRAINT AK_Isiku_seisundi_liik_nimetus UNIQUE (isiku_seisundi_liik_nimetus)
)
;

CREATE TABLE  Laadimispunkti_tyyp
(
	laadimispunkti_tyyp_kood smallint NOT NULL,
	nimetus nimetus,
	kWh smallint NOT NULL,
	CONSTRAINT PK_Laadimispunkti_tyyp PRIMARY KEY ( laadimispunkti_tyyp_kood ),
    CONSTRAINT AK_kWh UNIQUE(kWh),
    CONSTRAINT CHK_Laadimispunkti_tyyp_kWh_on_oige CHECK (kWh BETWEEN 0 AND 200)
)
;

CREATE TABLE  Laadimispunkti_kategooria
(
	laadimispunkti_kategooria_kood smallint NOT NULL,
	laadimispunkti_kategooria_nimetus nimetus,
	laadimispunkti_kategooria_tyyp_kood smallint NOT NULL,
	CONSTRAINT PK_Laadimispunkti_kategooria PRIMARY KEY ( laadimispunkti_kategooria_kood ),
    CONSTRAINT AK_Laadimispunkti_kategooria_kood_nimetus UNIQUE(laadimispunkti_kategooria_tyyp_kood, laadimispunkti_kategooria_nimetus),
	CONSTRAINT FK_Laadimispunkti_kategooria_tyyp_kood FOREIGN KEY ( laadimispunkti_kategooria_tyyp_kood ) REFERENCES  Laadimispunkti_kategooria_tyyp  ( laadimispunkti_kategooria_tyyp_kood ) ON DELETE No Action ON UPDATE CASCADE
)
;

CREATE TABLE  Isik
(
    isik_id BIGSERIAL NOT NULL,
	isikukood varchar(255) NOT NULL,
	synni_kp date NOT NULL,
	reg_aeg aeg DEFAULT LOCALTIMESTAMP(0),
	eesnimi varchar(50),
	perenimi varchar(50),
	elukoht varchar(1024),
	e_meil varchar(254) NOT NULL,
    riik_kood varchar(3) NOT NULL,
	isiku_seisundi_liik_kood smallint NOT NULL DEFAULT 0,
	CONSTRAINT PK_Isik PRIMARY KEY ( isik_id ),
    CONSTRAINT AK_Isik_id_riik UNIQUE (isikukood, riik_kood),
    CONSTRAINT CHK_Isik_eesnimi_or_perenimi_not_null CHECK (  eesnimi IS NOT NULL OR perenimi IS NOT NULL),
    CONSTRAINT CHK_Isik_eesnimi_ei_ole_tyhi_string CHECK ( eesnimi !~ '^[[:space:]]*$' ),
    CONSTRAINT CHK_Isik_perenimi_ei_ole_tyhi_string CHECK ( perenimi !~ '^[[:space:]]*$' ),
    CONSTRAINT CHK_Isik_synni_kp_on_oige CHECK ( (synni_kp BETWEEN To_DATE('01-01-1900', 'DD-MM-YYYY') AND To_DATE('31-12-2100', 'DD-MM-YYYY'))),
    CONSTRAINT CHK_Isik_synnikp_ei_ole_suurem_reg_ajast CHECK ( reg_aeg::date >= synni_kp  ),
    CONSTRAINT CHK_Isik_e_meil_on_oige CHECK (e_meil ~* '^[a-z0-9._%-]+@[a-z0-9.-]+[.][a-z]+$'),
    CONSTRAINT CHK_Isik_elukoht_ei_ole_tyhi_string CHECK ( elukoht !~ '^[[:space:]]*$' ),
    CONSTRAINT CHK_Isik_elukoht_ei_tohi_olla_ainult_numbrid CHECK ( elukoht !~ '^[0-9]+$' ),
	CONSTRAINT CHK_Isik_isikukood_on_oige CHECK ( isikukood !~ '^[[:space:]]*$' AND isikukood ~ '^[[:alnum:] \/+=-]+$'),
	CONSTRAINT FK_Isik_Isiku_seisundi_liik FOREIGN KEY ( isiku_seisundi_liik_kood ) REFERENCES  Isiku_seisundi_liik  ( isiku_seisundi_liik_kood ) ON DELETE No Action  ON UPDATE CASCADE ,
	CONSTRAINT FK_Isik_isikukoodi_riik FOREIGN KEY ( riik_kood ) REFERENCES  Riik  ( riik_kood ) ON DELETE No Action ON UPDATE Cascade
)
;

CREATE TABLE  Kasutajakonto
(
    isik_id bigint NOT NULL,
    parool varchar(50) NOT NULL,
	on_aktiivne boolean DEFAULT TRUE NOT NULL,
	CONSTRAINT PK_Kasutajakonto PRIMARY KEY ( isik_id ),
	CONSTRAINT CHK_Kasutajakonto_parool_ei_ole_tyhi_string CHECK ( parool !~ '^[[:space:]]*$'),
	CONSTRAINT FK_Kasutajakonto_Isik FOREIGN KEY ( isik_id ) REFERENCES  Isik  ( isik_id ) ON DELETE CASCADE ON UPDATE NO ACTION
)
;

CREATE TABLE  Tootaja
(
    isik_id bigint NOT NULL,
    tootaja_seisundi_liik_kood smallint NOT NULL DEFAULT 0,
	Mentor bigint,
	CONSTRAINT PK_Tootaja PRIMARY KEY ( isik_id ),
    CONSTRAINT CHK_Tootaja_isik_ja_mentor_ei_ole_samad CHECK( isik_id <> mentor ),
	CONSTRAINT FK_Tootaja_Tootaja_seisundi_liik FOREIGN KEY ( tootaja_seisundi_liik_kood ) REFERENCES  Tootaja_seisundi_liik  ( tootaja_seisundi_liik_kood ) ON DELETE No Action ON UPDATE CASCADE,
	CONSTRAINT FK_Tootaja_Isik FOREIGN KEY ( isik_id ) REFERENCES  Isik  ( isik_id ) ON DELETE CASCADE ON UPDATE NO ACTION ,
	CONSTRAINT FK_Tootaja_Mentor FOREIGN KEY ( Mentor ) REFERENCES  Tootaja  ( isik_id ) ON DELETE SET NULL ON UPDATE No Action
)
;

CREATE TABLE  Laadimispunkt
(

    Laadimispunkti_kood bigint NOT NULL,
    laiuskraad decimal(7,4) NOT NULL,
	pikkuskraad decimal(6,4) NOT NULL,
	laadimispunkti_nimetus nimetus,
	reg_aeg aeg DEFAULT LOCALTIMESTAMP(0),
	registreerija_id bigint NOT NULL,
	laadimispunkti_seisundi_liik_kood smallint NOT NULL DEFAULT 0,
    laadimispunkti_tyyp_kood smallint NOT NULL DEFAULT 0,
	CONSTRAINT PK_Laadimispunkt PRIMARY KEY ( Laadimispunkti_kood ),
    CONSTRAINT AK_Laadimimispunkti_nimetus UNIQUE(laadimispunkti_nimetus),
	CONSTRAINT CHK_Laadimispunkt_laiuskraad_on_oige CHECK (laiuskraad BETWEEN -180 AND 180),
	CONSTRAINT CHK_Laadimispunkt_pikkuskraad_on_oige CHECK (pikkuskraad BETWEEN -90 AND 90),
	CONSTRAINT FK_Laadimispunkt_Laadimispunkti_tyyp FOREIGN KEY ( laadimispunkti_tyyp_kood ) REFERENCES  Laadimispunkti_tyyp  ( laadimispunkti_tyyp_kood ) ON DELETE No Action ON UPDATE CASCADE ,
    CONSTRAINT FK_Laadimispunkt_registreerija_id FOREIGN KEY (registreerija_id) REFERENCES tootaja(isik_id),
    CONSTRAINT FK_Laadimispunkt_laadiimis_seisundi_liik_kood FOREIGN KEY (laadimispunkti_seisundi_liik_kood) REFERENCES laadimispunkti_seisundi_liik(laadimispunkti_seisundi_liik_kood) ON UPDATE CASCADE
)
;

CREATE TABLE  Klient
(
    isik_id bigint NOT NULL,
    on_nous_tylitamisega boolean DEFAULT FALSE NOT NULL,
    kliendi_seisundi_liik_kood smallint NOT NULL DEFAULT 0,
	CONSTRAINT PK_Klient PRIMARY KEY ( isik_id ),
	CONSTRAINT FK_Klient_Kliendi_seisundi_liik FOREIGN KEY ( kliendi_seisundi_liik_kood ) REFERENCES  Kliendi_seisundi_liik  ( kliendi_seisundi_liik_kood ) ON DELETE No Action ON UPDATE CASCADE ,
	CONSTRAINT FK_Klient_Isik FOREIGN KEY ( isik_id ) REFERENCES  Isik  ( isik_id ) ON DELETE CASCADE  ON UPDATE NO ACTION
)
;

CREATE TABLE  Laadimispunkti_kategooria_omamine
(
	Laadimispunkti_kood bigint NOT NULL,
    laadimispunkti_kategooria_kood smallint NOT NULL,
	CONSTRAINT PK_Laadimispunkti_kategooria_omamine PRIMARY KEY ( Laadimispunkti_kood , laadimispunkti_kategooria_kood ),
	CONSTRAINT FK_Laadimispunkti_kategooria_omamine_LP_K_kood FOREIGN KEY (Laadimispunkti_kood) REFERENCES laadimispunkt(laadimispunkti_kood) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_Laadimispunkti_kategooria_omamine_Laadimispunkti_kood FOREIGN KEY (laadimispunkti_kategooria_kood) REFERENCES laadimispunkti_kategooria(laadimispunkti_kategooria_kood) ON UPDATE CASCADE ON DELETE No Action
)
;

CREATE TABLE  Tootaja_rolli_omamine
(
    tootaja_rolli_omamine_id bigserial NOT NULL,
    alguse_aeg aeg DEFAULT LOCALTIMESTAMP(0),
	lopu_aeg aeg DEFAULT 'infinity'::timestamp without time zone,
    tootaja_roll_kood smallint NOT NULL,
	isik_id bigint NOT NULL,
	CONSTRAINT PK_Tootaja_rolli_omamine_id PRIMARY KEY ( tootaja_rolli_omamine_id ),
	CONSTRAINT AK_Tootaja_rolli_omamine_ei_saa_sama_algatada UNIQUE (isik_id, tootaja_roll_kood, alguse_aeg),
	CONSTRAINT CHK_Tootaja_rolli_omamine_lopp_on_suurem_algusest CHECK (lopu_aeg > alguse_aeg),
	CONSTRAINT FK_Tootaja_rolli_omamine_Tootaja_roll FOREIGN KEY ( tootaja_roll_kood ) REFERENCES  Tootaja_roll  ( tootaja_roll_kood ) ON DELETE No Action ON UPDATE CASCADE,
	CONSTRAINT FK_Tootaja_rolli_omamine_Tootaja FOREIGN KEY ( isik_id ) REFERENCES  Tootaja  ( isik_id ) ON DELETE CASCADE ON UPDATE NO ACTION
	)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

CREATE INDEX  IXFK_Isik_Isiku_seisundi_liik  ON  Isik  ( isiku_seisundi_liik_kood  ASC)
;

CREATE INDEX  IXFK_Laadimispunkt_Laadimispunkti_seisundi_liik  ON  Laadimispunkt  ( laadimispunkti_seisundi_liik_kood  ASC)
;

CREATE INDEX  IXFK_Laadimispunkt_Tootaja  ON  Laadimispunkt  ( registreerija_id  ASC)
;

CREATE INDEX IXFK_Isik_Isikukoodi_riik ON Isik (riik_kood)
;

CREATE INDEX IXFK_Klient_Kliendi_seisundi_liik ON Klient (kliendi_seisundi_liik_kood)
;

CREATE INDEX IXFK_Laadimispunkt_Laadimispunkti_tyyp ON Laadimispunkt (laadimispunkti_tyyp_kood)
;

CREATE INDEX IXFK_Tootaja_Mentor ON Tootaja (Mentor)
;

CREATE INDEX IXFK_Tootaja_Tootaja_seisundi_liik ON Tootaja (tootaja_seisundi_liik_kood)
;

CREATE INDEX IXFK_Tootaja_Tootaja_rolli_omamine ON Tootaja_rolli_omamine (tootaja_roll_kood)
;

CREATE INDEX IXFK_Laadimispunkti_kategooria_omamine_Laadimispunkti_kood ON Laadimispunkti_kategooria_omamine (laadimispunkti_kategooria_kood)
;

CREATE UNIQUE INDEX IXFK_Isik_e_meil_unq_idx ON isik (lower(e_meil))
;
