
DATA _NULL_;
    LENGTH ANO_MES $6 ANO_MES_BL $6;
    LENGTH DATA_REF1 DATA_REF2 DATA_REF_2 DATA_REF_2_FIM DATA_REF_3 DATA_REF_3_FIM $30;

    HJ = INTNX('MONTH', TODAY(), 0);
    DT_REF      = INTNX('MONTH', HJ, -1);
    DT_REF_B    = INTNX('MONTH', HJ, -1, 'B');
    DT_REF_E    = INTNX('MONTH', HJ, -1, 'E');
    DT_REF_B_2  = INTNX('MONTH', HJ, -2, 'B');
    DT_REF_E_2  = INTNX('MONTH', HJ, -2, 'E');
    DT_REF_B_3  = INTNX('MONTH', HJ, -3, 'B');
    DT_REF_E_3  = INTNX('MONTH', HJ, -3, 'E');

    /* Geração dos nomes de mês no formato 202504 */
    CALL SYMPUT("MES_REF1", PUT(DT_REF, YEAR4.) || PUT(MONTH(DT_REF), Z2.)); /* Usando MONTH para garantir o mês */
    CALL SYMPUT("MES_REF2", PUT(DT_REF_B_2, YEAR4.) || PUT(MONTH(DT_REF_B_2), Z2.));
    CALL SYMPUT("MES_REF3", PUT(DT_REF_B_3, YEAR4.) || PUT(MONTH(DT_REF_B_3), Z2.));

    /* Datas com sufixo 'd' para macro */
    CALL SYMPUT("DATA_REF1", "'" || PUT(DT_REF_B, DATE9.) || "'d");
    CALL SYMPUT("DATA_REF2", "'" || PUT(DT_REF_E, DATE9.) || "'d");
    CALL SYMPUT("DATA_REF_2", "'" || PUT(DT_REF_B_2, DATE9.) || "'d");
    CALL SYMPUT("DATA_REF_2_FIM", "'" || PUT(DT_REF_E_2, DATE9.) || "'d");
    CALL SYMPUT("DATA_REF_3", "'" || PUT(DT_REF_B_3, DATE9.) || "'d");
    CALL SYMPUT("DATA_REF_3_FIM", "'" || PUT(DT_REF_E_3, DATE9.) || "'d");
RUN;

/* Exibir os valores para verificar */
%PUT &MES_REF1.;
%PUT &MES_REF2.;
%PUT &MES_REF3.;
%PUT &DATA_REF1.;
%PUT &DATA_REF2.;
%PUT &DATA_REF_2.;
%PUT &DATA_REF_2_FIM.;
%PUT &DATA_REF_3.;
%PUT &DATA_REF_3_FIM.;


%extrair_ultimo_mes(mes_ref=&MES_REF3, data_ini=&DATA_REF_3, data_fim=&DATA_REF_3_FIM, plataforma=SISTEMA);
%extrair_ultimo_mes(mes_ref=&MES_REF2, data_ini=&DATA_REF_2, data_fim=&DATA_REF_2_FIM, plataforma=SISTEMA);
%extrair_ultimo_mes(mes_ref=&MES_REF1, data_ini=&DATA_REF1, data_fim=&DATA_REF2, plataforma=SISTEMA);





