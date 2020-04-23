# ---- Library ----
library(shiny)
library(shinydashboard)
library(forcats)
library(ggplot2)
library(plotly)
library(lubridate)
library(stringr)
library(tidyr)
library(purrr)
library(dplyr)
library(shinycssloaders)
library(leaflet)
library("mxmaps")

# ---- carga datos
data("df_mxmunicipio")
# ---- tweet-conf-dash Functions ----
source(here::here("R/leerCatalogos.R"))
source(here::here("R/desnormaliza.R"))
source(here::here("R/preparaData.R"))
source(here::here("R/maps.R"))

CAPACIDAD_TLAXCALA <- data.frame(
  "camasHospital" = 714,
  "camasUCI" = 34
)