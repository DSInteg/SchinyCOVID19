#Prepara DAta Frame
COVID19_Mexico$DIAS_ESPERA_INGRESO <- COVID19_Mexico$FECHA_INGRESO - COVID19_Mexico$FECHA_SINTOMAS
COVID19_Mexico$DIAS_SINTOMAS_DEF <- COVID19_Mexico$FECHA_DEF - COVID19_Mexico$FECHA_SINTOMAS
COVID19_Mexico$DIAS_INGRESO_DEF <- COVID19_Mexico$FECHA_DEF - COVID19_Mexico$FECHA_INGRESO

COVID19_COUNT_POSITIVO <- COVID19_Mexico %>% 
  filter(ENTIDAD_UM == "TLAXCALA" & RESULTADO == "Positivo SARS-CoV-2" ) %>% 
  group_by(ENTIDAD_RES,MUNICIPIO,RESULTADO) %>% 
  summarise(CANTIDAD = n())

COVID19_COUNT <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA"  ) %>% 
  group_by(ENTIDAD_RES,MUNICIPIO,RESULTADO) %>% 
  summarise(CANTIDAD = n())  

df_mxmunicipio$state_name_official <- toupper(df_mxmunicipio$state_name_official)
df_mxmunicipio$municipio_name <- toupper(df_mxmunicipio$municipio_name)
df_mxmunicipio_TLX <- df_mxmunicipio %>% 
  filter(state_name_official == "TLAXCALA") %>% 
  left_join(COVID19_COUNT_POSITIVO, by = c("state_name_official"="ENTIDAD_RES","municipio_name"="MUNICIPIO"))


df_mxmunicipio_TLX <- df_mxmunicipio_TLX %>% ungroup(CANTIDAD) %>%
  mutate(MUNICIPIO= fct_reorder(municipio_name, desc(CANTIDAD)))

ENFERMOS_MUNICIPIO <- COVID19_COUNT_POSITIVO %>% 
  select(ENTIDAD_RES, MUNICIPIO,CANTIDAD)    

ENFERMOS_MUNICIPIO <- ENFERMOS_MUNICIPIO %>% ungroup(CANTIDAD) %>%
  mutate(MUNICIPIO= fct_reorder(MUNICIPIO, desc(CANTIDAD))) %>% select(MUNICIPIO,CANTIDAD)

### Total Contagios ------------------

TOTAL_CONTAGIOS <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & RESULTADO == "Positivo SARS-CoV-2" ) %>% 
  group_by(ENTIDAD_UM ) %>% 
  summarise(CANTIDAD = n())

TOTAL_CONTAGIOS_HOMBRE <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & RESULTADO == "Positivo SARS-CoV-2" & SEXO=="HOMBRE" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())   

TOTAL_CONTAGIOS_MUJER <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & RESULTADO == "Positivo SARS-CoV-2" & SEXO=="MUJER" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())


### Total Ambulatorio ------------------

TOTAL_AMBULATORIO <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & TIPO_PACIENTE == "AMBULATORIO" & RESULTADO == "Positivo SARS-CoV-2" ) %>% 
  group_by(ENTIDAD_UM) %>%    
  summarise(CANTIDAD = n()) 

TOTAL_AMBULATORIO_HOMBRE <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & TIPO_PACIENTE == "AMBULATORIO" & RESULTADO == "Positivo SARS-CoV-2" & SEXO=="HOMBRE") %>% 
  group_by(ENTIDAD_UM) %>%    
  summarise(CANTIDAD = n()) 

TOTAL_AMBULATORIO_MUJER <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & TIPO_PACIENTE == "AMBULATORIO" & RESULTADO == "Positivo SARS-CoV-2"& SEXO=="MUJER" ) %>% 
  group_by(ENTIDAD_UM) %>%    
  summarise(CANTIDAD = n()) 

### Total Hospitalizados --------------------


TOTAL_HOSPITALIZADOS <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & TIPO_PACIENTE == "HOSPITALIZADO" & RESULTADO == "Positivo SARS-CoV-2" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()) 

TOTAL_HOSPITALIZADOS_HOMBRE <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & TIPO_PACIENTE == "HOSPITALIZADO" & RESULTADO == "Positivo SARS-CoV-2" & SEXO == "HOMBRE" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

TOTAL_HOSPITALIZADOS_MUJER <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & TIPO_PACIENTE == "HOSPITALIZADO" & RESULTADO == "Positivo SARS-CoV-2" & SEXO == "MUJER" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())   


### Total de defunciones ------------------

TOTAL_DEFUNCIONES <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()) 

TOTAL_DEFUNCIONES_HOMBRE <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & SEXO == "HOMBRE") %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()) 

TOTAL_DEFUNCIONES_MUJER <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF) & RESULTADO == "Positivo SARS-CoV-2" & SEXO == "MUJER") %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()) 


### Total Intubados -------------------------

TOTAL_INTUBADO <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  INTUBADO == "SI"  ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()  )  

TOTAL_INTUBADO_HOMBRE <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  INTUBADO == "SI" & SEXO == "HOMBRE" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()  )  

TOTAL_INTUBADO_MUJER <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  INTUBADO == "SI" & SEXO == "MUJER" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()  )  

### Total UCI -------------------------

TOTAL_UCI <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  UCI == "SI"  ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()  )  

TOTAL_UCI_HOMBRE <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  UCI == "SI" & SEXO == "HOMBRE" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()  )  

TOTAL_UCI_MUJER <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  UCI == "SI" & SEXO == "MUJER" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()  )  

### Edad defuncion  ---------------

EDAD_DEFUNCION <- COVID19_Mexico %>% 
  filter(ENTIDAD_UM == "TLAXCALA" & DIAS_SINTOMAS_DEF != 'NA' & RESULTADO == "Positivo SARS-CoV-2" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(MENOR_EDAD = min(EDAD), MAYOR_EDAD = max(EDAD)) 

TIEMPO_DEFUNCION <- COVID19_Mexico %>% 
  filter(ENTIDAD_UM == "TLAXCALA" & DIAS_SINTOMAS_DEF != 'NA' & RESULTADO == "Positivo SARS-CoV-2" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(PROMEDIO_ESPERA_DECUNCION = mean(DIAS_SINTOMAS_DEF))


## Padecimientos de fallecidos COVID ----------
TOTAL_CONTAGIADO_OBESIDAD <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & OBESIDAD == "SI" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()) 


## Padecimientos de Contagiados COVID ----------
  ## Obecidad ------------------
TOTAL_FALLECIDOS_OBESIDAD <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & OBESIDAD == "SI" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()) 

TOTAL_FALLECIDOS_OBESIDAD_HOMBRE <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & OBESIDAD == "SI" & SEXO =="HOMBRE" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()) 

TOTAL_FALLECIDOS_OBESIDAD_MUJER <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & OBESIDAD == "SI" & SEXO =="MUJER" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n()) 
  
  ## Diabolica --------------

TOTAL_FALLECIDOS_DIABETES <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & DIABETES == "SI" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

TOTAL_FALLECIDOS_DIABETES_HOMBRE <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & DIABETES == "SI" & !is.na(FECHA_DEF) & SEXO == "HOMBRE" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

TOTAL_FALLECIDOS_DIABETES_MUJER <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & DIABETES == "SI" & !is.na(FECHA_DEF) & SEXO == "MUJER" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

  ## EPOC -----------------

TOTAL_FALLECIDOS_EPOC <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & EPOC == "SI" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())


## ASMA ---------------

TOTAL_FALLECIDOS_ASMA <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & ASMA == "SI" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

### INMUSUPR --------------

TOTAL_FALLECIDOS_INMUSUPR <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & INMUSUPR  == "SI" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

## Hipertension -------------

TOTAL_FALLECIDOS_HIPERTENSION <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & HIPERTENSION  == "SI" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

TOTAL_FALLECIDOS_HIPERTENSION_HOMBRE <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & HIPERTENSION  == "SI" & SEXO == "HOMBRE" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

TOTAL_FALLECIDOS_HIPERTENSION_MUJER <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & HIPERTENSION  == "SI" & SEXO == "MUJER" & !is.na(FECHA_DEF) ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

## Cardiovascular ------------

TOTAL_FALLECIDOS_CARDIOVASCULAR <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & CARDIOVASCULAR  == "SI") %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

### Renal cronica ---------

TOTAL_FALLECIDOS_RENAL_CRONICA <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & RENAL_CRONICA  == "SI") %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())

### Tabaquismo ------------

TOTAL_FALLECIDOS_TABAQUISMO <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" & !is.na(FECHA_DEF)  & RESULTADO == "Positivo SARS-CoV-2" & TABAQUISMO  == "SI") %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(CANTIDAD = n())


# Tiempo que tarda en asistir a servicios médicos  ---------------

TIEMPO_INGRESO <- COVID19_Mexico %>% 
  filter(ENTIDAD_UM == "TLAXCALA" & TIPO_PACIENTE == "HOSPITALIZADO" & RESULTADO == "Positivo SARS-CoV-2" ) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(PROMEDIO_ESPERA_INGRESO = mean(DIAS_ESPERA_INGRESO))

TIEMPO_INGRESO_DEFUNCION <- COVID19_Mexico %>% 
  filter(ENTIDAD_UM == "TLAXCALA" & TIPO_PACIENTE == "HOSPITALIZADO" & RESULTADO == "Positivo SARS-CoV-2" &  !is.na(FECHA_DEF)) %>% 
  group_by(ENTIDAD_UM) %>% 
  summarise(PROMEDIO_ESPERA_INGRESO = mean(DIAS_ESPERA_INGRESO)) 

TIEMPO_INGRESO_MUNICIPIOS <-  COVID19_Mexico %>% 
  filter(ENTIDAD_UM == "TLAXCALA" & TIPO_PACIENTE == "HOSPITALIZADO" & RESULTADO == "Positivo SARS-CoV-2"  &  !is.na(FECHA_DEF)) %>% 
  group_by(ENTIDAD_UM, MUNICIPIO) %>%
  summarise(PROMEDIO_ESPERA_INGRESO = mean(DIAS_ESPERA_INGRESO) )
  
## Cantidad de Enfermos Hospitales

COVID19_SECTOR <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  RESULTADO == "Positivo SARS-CoV-2"  ) %>% 
  group_by(ENTIDAD_UM,SECTOR) %>% 
  summarise(CANTIDAD = n()  )   

COVID19_INTUBADO <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  INTUBADO == "SI"  ) %>% 
  group_by(ENTIDAD_UM,SECTOR) %>% 
  summarise(CANTIDAD = n()  )   


COVID19_HOSPITALIZADO <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  RESULTADO == "Positivo SARS-CoV-2" & TIPO_PACIENTE == "HOSPITALIZADO" ) %>% 
  group_by(ENTIDAD_UM,SECTOR) %>% 
  summarise(CANTIDAD = n()  )  

COVID19_DEFUNCION <- COVID19_Mexico %>% 
  filter( ENTIDAD_UM == "TLAXCALA" &  DIAS_SINTOMAS_DEF >-1    & DIAS_SINTOMAS_DEF != 'NA'  ) %>% 
  group_by(ENTIDAD_UM,SECTOR) %>% 
  summarise(CANTIDAD = n()  ) 




  
  