REVOKE CONNECT, TEMP ON DATABASE t205940 FROM PUBLIC;
REVOKE TEMP ON DATABASE t205940 FROM PUBLIC;
REVOKE USAGE ON DOMAIN public.aeg FROM PUBLIC;
REVOKE USAGE ON DOMAIN public.nimetus FROM PUBLIC;
REVOKE USAGE ON LANGUAGE plpgsql FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_aktiveeri_laadimispunkt(p_laadimispunkti_kood bigint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_muuda_laadimispunkt_mitteaktiivseks(p_laadimispunkti_kood bigint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_registreeri_laadimispunkt(p_laadimispunkti_kood bigint, p_laiuskraad numeric, p_pikkuskraad numeric, p_nimetus nimetus, p_tootaja_id bigint, p_tyyp_kood smallint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_unusta_laadimispunkt(p_laadimispunkti_kood bigint) FROM PUBLIC;
REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA laiendused FROM PUBLIC;
