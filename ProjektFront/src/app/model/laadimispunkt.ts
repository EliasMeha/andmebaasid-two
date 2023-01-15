export interface Laadimispunkt {
  laadimispunkti_kood: number;
  laiuskraad: number;
  nimetus: string;
  pikkuskraad: number;
  reg_aeg: Date;
  registreerija_id: string;
  laadimispunkti_seisundi_liik_kood: string;
  laadimispunkti_tyyp_nimi: string;
  laadimispunkti_tyyp_kwh: number;
  laadimispunkti_seisundi_liik_nimetus: string,
  eesnimi: string,
  perenimi: string,
  registreerija_nimi: string,
  e_post: string,
  kategooriad: Map<number, object>;
}
