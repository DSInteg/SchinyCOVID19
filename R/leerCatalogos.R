library(readr)
library(readxl)


path = here::here("data-raw/Catalogos_0412.xlsx")
COL_NAMES <- c("CLAVE","DESCRIPCION")

#Lectura de Catalogos
ENTIDADES <- read_excel(path, sheet = "ENTIDADES")
MUNICIPIOS <- read_excel(path, sheet = "MUNICIPIOS")

ORIGEN <- read_excel(path, sheet = "ORIGEN")
SECTOR <- read_excel(path, sheet = "SECTOR")
TIPO_PACIENTE <- read_excel(path, sheet = "TIPO_PACIENTE")
SEXO <- read_excel(path, sheet = "SEXO")
SI_NO <- read_excel(path, sheet = "SI_NO")
RESULTADO <- read_excel(path, sheet = "RESULTADO")
NACIONALIDAD <- read_excel(path, sheet = "NACIONALIDAD")

names(ORIGEN) <- COL_NAMES
names(SECTOR) <- COL_NAMES
names(TIPO_PACIENTE) <- COL_NAMES
names(SEXO) <- COL_NAMES
names(SI_NO) <- COL_NAMES
names(RESULTADO) <- COL_NAMES
names(NACIONALIDAD) <- COL_NAMES



#Lectura de datos COVID 
path = here::here("data-raw/COVID19MEXICO.csv")
COVID19_Mexico <- read_csv(path, 
                             col_types = cols(ENTIDAD_NAC = col_integer(), 
                                              ENTIDAD_RES = col_integer(), ENTIDAD_UM = col_integer(), 
                                              FECHA_DEF = col_date(format = "%Y-%m-%d"), 
                                              FECHA_INGRESO = col_date(format = "%Y-%m-%d"), 
                                              FECHA_SINTOMAS = col_date(format = "%Y-%m-%d"), 
                                              MUNICIPIO_RES = col_integer()), locale = locale(encoding = 'latin1'))
