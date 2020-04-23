#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)


header <- dashboardHeader(
  title = "COVID19 - Tlaxcala")


sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Mapa", tabName = "dashboard", icon = icon("map-marked-alt")),
    menuItem("Estadísticas", icon = icon("table"), tabName = "widgets"),
    menuItem("¿Por qué?", icon = icon("table"), tabName = "tab_about")
  )
)


body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")),
  tabItems(
    #Seccion Principal ----------------------
    tabItem(tabName = "dashboard",
            h2("Estadística de infecciones por COVID19 en el estado de Tlaxcala "),
            fluidRow(
              column(width = 12,
                # Dynamic infoBoxes
                infoBoxOutput("totalContagios", width = 3),
                infoBoxOutput("totalAmbulatorios", width = 3),
                infoBoxOutput("totalHospitalizados", width = 3),
                infoBoxOutput("totalDefunciones", width = 3)           
              )
            ),
            fluidRow(
              column(width = 3,
                     # Dynamic infoBoxes
                     infoBoxOutput("totalContagiosHombre", width = 6),
                     infoBoxOutput("totalContagiosMujer", width =6)
              ),
              column(width = 3,
                     infoBoxOutput("totalAmbulatoriosHombre", width = 6),
                     infoBoxOutput("totalAmbulatoriosMujer", width = 6 )
                     ),
              column(width = 3,
                     infoBoxOutput("totalHospitalizadosHombre", width = 6),
                     infoBoxOutput("totalHospitalizadosMujer", width = 6)
                     ),
              column(width = 3, 
                     infoBoxOutput("TotalDefuncionesHombre", width = 6),  
                     infoBoxOutput("TotalDefuncionesMujer", width = 6)
                     )
            ),            
            h3("Municipio de residencia de contagiados de COVID-19 atendidos en Tlaxcala"), hr(),
            fluidRow(
              column(width = 12,
                     plotOutput("histMunicipios",width = "100%", height = "900px")
              )
            ),
            h3("Tasa de contagios por cada 1,000 habitantes"), hr(),
            fluidRow(
              column(width = 12,
                     plotOutput("histTasaMunicipios",width = "100%", height = "900px")
              )
            ),
            h3("Municipios con presencia de contagiados"), hr(),
            fluidRow(
              column(width = 12,
                plotOutput("distPlot",width = "100%", height = "900px")
              )              
            ),
            h3("Municipios donde habitan contagiados con COVID-19 atendidos en intituciones de Tlaxcala"), hr(),
            fluidRow(
              column(width = 8,
                     DT::dataTableOutput("table")),
              tags$a( href="https://datos.gob.mx/busca/dataset/informacion-referente-a-casos-covid-19-en-mexico", "Fuente datos.gob.mx",target="_blank")  
            )
              
    ),
    # Seccion de estadisticas --------------------------
    tabItem(tabName = "widgets",
            h2("Comportamiento de pacientes de COVID19 en el estado de Tlaxcala "),
            fluidRow(
              column(width = 12,
                     # Dynamic infoBoxes
                     infoBoxOutput("esperaIngreso", width = 3),
                     infoBoxOutput("esperaDefuncion", width = 3)
              )
            ),
            h3("Instituciones que atienden contagios de COVID-19 en Tlaxcala"), hr(),
            fluidRow(
              column(width = 6,
                     plotOutput("distContagiados",width = "100%", height = "900px")
              ), 
              column(width = 6,
                     plotOutput("distIntubados",width = "100%", height = "900px")
              ),
            ), hr(),
            fluidRow(
              column(width = 6,
                     plotOutput("distHospitalizados",width = "100%", height = "900px")
              ), 
              column(width = 6,
                     plotOutput("distDefunciones",width = "100%", height = "900px"),
                     tags$a( href="https://datos.gob.mx/busca/dataset/informacion-referente-a-casos-covid-19-en-mexico", "Fuente datos.gob.mx",target="_blank")
              ),
            )
    ),
    # Razon del portal - tab_about -------------------------------------------------------
    tabItem(
      tabName = "tab_about",
        fluidRow(
          box(
            status = "danger",
            width = "12",
            tags$h1("¿Por qué construir este portal?"),
            tags$p(
              "Este portal se contruyó con el solo fin de acercar a los Tlaxcaltecas",
              " información que el Gobierno de México vía la plataforma de ", 
              HTML(paste0(tags$a( href="https://datos.gob.mx/busca/dataset/informacion-referente-a-casos-covid-19-en-mexico", "Datos Abiertos",target="_blank"), ",")),
              " transparentó y puso a la disposición de los ciudadanos,",
              "los datos se actualizan diariamente y podría tener variación respecto a las cifras últimas que publique el gobierno del estado, ",
              "debido a los cortes que se realizan durante al día y retrasos que exiten entre las diferentes intituciones. ",
              "La información que aquí se presenta puede ser compartida, sin embargo no nos hace responsable de interpretaciones incorrectas."
            ),
            tags$p("El tiempo que inverti en hacer este portal es mi granito de arena, creo en que la información nos puede dar tranquilidad."),
            tags$p(
              "Cualquier duda o comentario pueden diriguirse a:",
              HTML(paste0("(", tags$a(href = "https://twitter.com/che_chino", "@che_chino", target = "_blank"), "),")),
              "o en la sección de comentarios de la web:",
              HTML(paste0(tags$a(href = "http://dsinteg.com", "dsinteg.com", target = "_blank"), ".")),
              "por email a:",
              HTML(paste0(tags$a(href = "mailto:jcordova@dsinteg.com", "jcordova@dsinteg.com"), "."))
            )
          )
        )
    )
  )
)


dashboardPage(
  header,
  sidebar,
  body
)
