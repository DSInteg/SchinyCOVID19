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
library(shinycssloaders)

header <- dashboardHeader(
  title = "COVID19 - Tlaxcala")


sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Mapa", tabName = "dashboard", icon = icon("map-marked-alt")),
    menuItem("¿Por qué?", icon = icon("table"), tabName = "tab_about")
  )
)


body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
    tags$link(rel="icon", 
              href="http://dsinteg.com/img/favicon.ico", 
              type="image/x-icon"),
    HTML(paste0('
                    <!-- Global site tag (gtag.js) - Google Analytics -->
                    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-163870420-1"></script>
                    <script>
                      window.dataLayer = window.dataLayer || [];
                      function gtag(){dataLayer.push(arguments);}
                      gtag(\'js\', new Date());
                    
                      gtag(\'config\', \'UA-163870420-1\');
                    </script>

                   ')
      )
    ),
   
  tabItems(
    # Seccion Principal ----------------------
    tabItem(tabName = "dashboard",
    ### Estadisticas de Contagio -------------
      tags$p(
        class = "text-center",
        tags$img(class = "img-responsive img-rounded center-block", src = "http://dsinteg.com/img/QuedateEnCasa-01.png", style = "max-width: 150px;")),
            h1("Estadística de contagios por COVID19 en el estado de Tlaxcala, actualizado a 20 de Mayo 2020 "),
            tags$a( href="https://datos.gob.mx/busca/dataset/informacion-referente-a-casos-covid-19-en-mexico", "Fuente: datos.gob.mx",target="_blank"),hr(),
    
            h2("Resumen de Transmisiones" ),p("En Tlaxcala, el primer paciente contagiado con COVID-19 fue hospitalizado el día 23 de marzo."),
            ## TOTAL Contagios -----------
  
            #fluidRow(
            #  column(width = 12,
            #          sliderInput("DatesMerge",
            #                      "Dates:",
            #                      min = as.Date("2020-03-23","%Y-%m-%d"),
            #                      max = as.Date(Sys.Date(),"%Y-%m-%d"),
            #                      value=as.Date(Sys.Date()),
            #                      timeFormat="%Y-%m-%d", width = '100%')                     
            #         )
            #),
            ## TOTAL Contagios -----------
            fluidRow(
              column(width = 12,
                    # Dynamic infoBoxes
                    infoBoxOutput("totalContagios", width = 4) %>% withSpinner(color="#0dc5c1"),
                    infoBoxOutput("totalContagiosHombre", width = 4),
                    infoBoxOutput("totalContagiosMujer", width =4)                
              )
            ),
            ## Total Atencion Ambulatoria ----------
            fluidRow(
              column(width = 12,
                    #Dynamic infoBoxes
                    infoBoxOutput("totalAmbulatorios", width = 4),
                    infoBoxOutput("totalAmbulatoriosHombre", width = 4),
                    infoBoxOutput("totalAmbulatoriosMujer", width = 4 )
              )
            ),
            ## Total Hospitalizados --------------
            fluidRow(
              column(width = 12,
                     infoBoxOutput("totalHospitalizados", width = 4),
                     infoBoxOutput("totalHospitalizadosHombre", width = 4),
                     infoBoxOutput("totalHospitalizadosMujer", width = 4)
                           
              )              
            ),
            ## Total UCI --------------
            fluidRow(
              column(width = 12, 
                     infoBoxOutput("totalUCI", width = 4),
                     infoBoxOutput("totalUCIHombre", width = 4),  
                     infoBoxOutput("totalUCIMujer", width = 4)
              )              
            ),     
            ## Total Intubados --------------
            fluidRow(
              column(width = 12, 
                     infoBoxOutput("totalIntubados", width = 4),
                     infoBoxOutput("totalIntubadosHombre", width = 4),  
                     infoBoxOutput("totalIntubadosMujer", width = 4)
              )              
            ),    
            ## Total Defunciones --------------
            fluidRow(
              column(width = 12, 
                     infoBoxOutput("totalDefunciones", width = 4),
                     infoBoxOutput("TotalDefuncionesHombre", width = 4),  
                     infoBoxOutput("TotalDefuncionesMujer", width = 4)
              )              
            ),
    
            ### Capacidad de hospitales en Tlaxcala
    
            h2("Capacidad de Hopitalización en Tlaxcala"),    
            fluidRow(
              column(width = 12,
                     valueBoxOutput("capacidadHospitales", width = 6),
                     valueBoxOutput("capacidadUCI", width = 6)
              )
            ),  
            fluidRow(
              column(width = 12,
                     valueBoxOutput("porcentajeCapacidadHospitalizados", width = 6),
                     valueBoxOutput("porcentajeCapacidadUCI", width = 6)
              )
            ),    
            fluidRow(
              column(width=12,
                     tags$a( href="https://www.mexicovid19.mx/seguimientoestados.html#section2", "Fuente: mexicovid19.mx",target="_blank"),hr())
            ),
    
    
            ### Caracteristicas de las personas contagiadas con COVID
            h2("Padecimientos de las personas fallecidas por COVID-19"),
            fluidRow(
              column(width = 12,
                     infoBoxOutput("totalFallecidosObesidad", width = 4),
                     infoBoxOutput("totalFallecidosHipertencion", width = 4),  
                     infoBoxOutput("totalFallecidosDiabetes", width = 4)
                     )
            ),
            fluidRow(
              column(width = 12,
                     infoBoxOutput("totalFallecidosCardiovascular", width = 4),
                     infoBoxOutput("totalFallecidosTabaquismo", width = 4),  
                     infoBoxOutput("totalFallecidosRenalCronica", width = 4)
              )
            ),  
    
    
    
            ### Estadisticas de Fallecimiento  
            h2("Edad de personas fallecidas"),
            ### Tiempo que tarda una persona en fallecer
            fluidRow(
              column(width = 12,
                     valueBoxOutput("edadMenorDefuncion", width = 6),
                     valueBoxOutput("edadMayorDefuncion", width = 6)
              )
            ),
            ###   Tiempo que pasa antes de morir --------
            h2("Tiempo que pasa entre inicio de síntomas y el fallecimiento"),
            ### Tiempo que tarda una persona en fallecer
            fluidRow(
              column(width = 12,
                     valueBoxOutput("esperaDefuncion", width = 12)
              )
            ),    
        ### Estadisticas de Atencion ------------
            h2("Tiempo que espera para asistir al servicio médico a partir de tener síntomas"),
            ## Comportamiento dias atención
            fluidRow(
              column(width = 12,
                     column(width = 6,
                            valueBoxOutput("esperaIngresoTex", width = 12) 
                     ),
                     column(width = 6,
                       valueBoxOutput("esperaIngreso", width = 12)
                     )
              )
            ),
    #### Graficas por municipios -------------
            h3("Municipios con mas de diez contagiados de COVID-19 en Tlaxcala"), hr(),
            ## Histograma Contagios por Municipio ------------
            fluidRow(
              column(width = 12,
                     plotOutput("histMunicipios",width = "100%", height = "900px")
              )
            ),
            ## Histograma Tasa de Contagios por 1,000 habitantes Municipio ------------
            h3("Tasa de contagios por cada 1,000 habitantes"), hr(),
            fluidRow(
              column(width = 12,
                     plotOutput("histTasaMunicipios",width = "100%", height = "900px")
              )
            ),
            ## Mapa Contagios por Municipio -------------
            h3("Municipios con presencia de contagios"), h4("Si visualizas desde un movil, rota tu telefono horizontalmente"),hr(),
            fluidRow(
              column(width = 12, 
                     leafletOutput("distPlot", width = "100%", height = 700)
              )              
            ),
            ## Tabla Contagios por Municipio -------------
            h3("Municipios de residencia de contagiados de con COVID-19 atendidos en intituciones de Tlaxcala"), hr(),
            fluidRow(
              column(width = 6, box(width = 12, DT::dataTableOutput("table"))  )
                       
            ),
    ### Histogramas Instituciones ----------------
            h3("Instituciones que atienden contagios de COVID-19 en Tlaxcala"), hr(),
            fluidRow(
              column(width = 4,
                     plotOutput("distContagiados",width = "100%")
              ), 
              column(width = 4,
                     plotOutput("distIntubados",width = "100%")
              ),
              column(width = 4,
                     plotOutput("distUCI",width = "100%")
              )
            ), hr(),
            fluidRow(
              column(width = 6,
                     plotOutput("distHospitalizados",width = "100%")
              ), 
              column(width = 6,
                     plotOutput("distDefunciones",width = "100%")
              ),
            ),
     ### Raon de construir portal -----------
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
        ),
        tags$p(tags$a(href = "http://dsinteg.com", target = "_blank",
                      HTML(paste0(
                        tags$img(src="http://dsinteg.com/img/logo_dsinteg.png")  
                        ))
                      )
          )
      )
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
            ),
            tags$p(HTML(paste0(
              tags$img(src="http://dsinteg.com/img/logo_dsinteg.png")  
            )))  
          )
        )
    )
  )
)


dashboardPage(
  title = "Estadisticas COVID-19 Tlaxcala",
  header,
  sidebar,
  body
)
