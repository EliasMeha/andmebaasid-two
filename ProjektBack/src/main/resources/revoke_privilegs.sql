REVOKE CONNECT, TEMP ON DATABASE t205940 FROM PUBLIC;
REVOKE TEMP ON DATABASE t205940 FROM PUBLIC;
REVOKE USAGE ON DOMAIN public.aeg FROM PUBLIC;
REVOKE USAGE ON DOMAIN public.nimetus FROM PUBLIC;
REVOKE USAGE ON LANGUAGE plpgsql FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_aktiveeri_laadimispunkt(p_laadimispunkti_kood bigint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_muuda_laadimispunkt_mitteaktiivseks(p_laadimispunkti_kood bigint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_registreeri_laadimispunkt(p_laadimispunkti_kood bigint, p_laiuskraad numeric, p_pikkuskraad numeric, p_nimetus nimetus, p_tootaja_id bigint, p_tyyp_kood smallint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_unusta_laadimispunkt(p_laadimispunkti_kood bigint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_eemalda_laadimispunkt_kategooriast(p_laadimispunkti_kood bigint, p_laadimispunkti_kategooria_kood smallint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_lisa_laadimispunkt_kategooriasse(p_laadimispunkti_kood bigint, p_laadimispunkti_kategooria_kood smallint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_lopeta_laadimispunkt(p_laadimispunkti_kood bigint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_muuda_laadimispunkt(p_laadimispunkti_kood_vana bigint, p_laadimispunkti_kood_uus bigint, p_nimetus nimetus, p_laiuskraad numeric, p_pikkuskraad numeric, p_laadimispunkti_tyyp_kood smallint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_kontrolli_juhataja_saab_sisse_logida(p_isik_e_meil character varying, p_isik_parool character varying) FROM PUBLIC;
REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA laiendused FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_trig_muuda_laadimispunkti_seisundi_liiki() FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_trig_unusta_laadimispunkt() FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_trig_uus_laadimispunkt() FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_trig_laadimispunkt_kuulub_kategooriasse() FROM PUBLIC;
REVOKE CONNECT ON DATABASE t205940 FROM t205940_juhataja;
REVOKE USAGE ON SCHEMA public FROM t205940_juhataja;
REVOKE EXECUTE ON FUNCTION f_lopeta_laadimispunkt(p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE),
    f_kontrolli_juhataja_saab_sisse_logida(p_isik_e_meil isik.e_meil%TYPE,
    p_isik_parool kasutajakonto.parool%TYPE) FROM t205940_juhataja;
REVOKE SELECT ON laadimispunkt_detailid, laadimispunkt_kategooria_omamised, laadimispunkt_koik_seisundiga, laadimispunkt_koondaruanne, laadimispunkt_saab_lopetada FROM t205940_juhataja;


GRANT CONNECT ON DATABASE t205940 TO t205940_juhataja;
GRANT USAGE ON SCHEMA public TO t205940_juhataja;
GRANT EXECUTE ON FUNCTION f_lopeta_laadimispunkt(p_laadimispunkti_kood laadimispunkt.laadimispunkti_kood%TYPE),
    f_kontrolli_juhataja_saab_sisse_logida(p_isik_e_meil isik.e_meil%TYPE,
    p_isik_parool kasutajakonto.parool%TYPE) TO t205940_juhataja;
GRANT SELECT ON laadimispunkt_detailid, laadimispunkt_kategooria_omamised, laadimispunkt_koik_seisundiga, laadimispunkt_koondaruanne, laadimispunkt_saab_lopetada TO t205940_juhataja;
