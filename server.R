# debug
# .tweets_all <- readRDS(here::here("data/tweets.rds")) %>%
#       mutate(created_at = lubridate::with_tz(created_at, tz_global())) %>%
#       tweets_since(TWEETS_START_DATE) %>%
#       tweets_not_hashdump() %>%
#       is_topic_tweet(rlang::splice(TOPIC$terms))
# tweets <- function() .tweets_all %>% filter(is_topic)



library("ggrepel")



function(session, input, output) {
    # Dashboard Principal ---- Demo Modal ----
  
     
  # Capacidades Hospitales --------------
  output$todosContagios <- renderInfoBox({
    infoBox(
      "TOTAL DE CONTAGIOS", 
      tags$p(TOTAL_CONTAGIOS$CANTIDAD, style = "font-size: 200%;"), 
      icon = icon("notes-medical"),
      color = "blue"
    )
  }) 
  
  output$todosDefunciones <- renderInfoBox({
    infoBox(
      "TOTAL DE CONTAGIOS", 
      tags$p(TOTAL_CONTAGIOS$CANTIDAD, style = "font-size: 200%;"), 
      icon = icon("notes-medical"),
      color = "blue"
    )
  })
    
      
    # Total de Contagios -------
    output$totalContagios <- renderInfoBox({
        infoBox(
            "TOTAL DE CONTAGIOS", 
            tags$p(TOTAL_CONTAGIOS$CANTIDAD, style = "font-size: 200%;"), 
            icon = icon("notes-medical"),
            color = "blue"
        )
    })
    
    output$totalContagiosHombre <- renderInfoBox({
        infoBox(
            "Hombres", 
            tags$p(TOTAL_CONTAGIOS_HOMBRE$CANTIDAD, style = "font-size: 200%;"), 
            icon = icon("male"),
            color = "blue"
        )
    })   
    
    output$totalContagiosMujer <- renderInfoBox({
        infoBox(
            "Mujeres", 
            tags$p(TOTAL_CONTAGIOS_MUJER$CANTIDAD, style = "font-size: 200%;"), 
            icon = icon("female"),
            color = "blue"
        )
    }) 
    
    
    ## Total abulatorios --------------
    output$totalAmbulatorios <- renderInfoBox({
        infoBox(
            "Atención Ambulatoria", 
            tags$p(TOTAL_AMBULATORIO$CANTIDAD, style = "font-size: 200%;"), 
            icon = icon("stethoscope"),
            color = "green"
        )
    })  
    
    output$totalAmbulatoriosHombre <- renderInfoBox({
        infoBox(
            "Hombres", 
            tags$p(TOTAL_AMBULATORIO_HOMBRE$CANTIDAD, style = "font-size: 200%;"), 
            icon = icon("male"),
            color = "green"
        )
    })
    
    output$totalAmbulatoriosMujer <- renderInfoBox({
        infoBox(
            "Mujeres", 
            tags$p(TOTAL_AMBULATORIO_MUJER$CANTIDAD, style = "font-size: 200%;"), 
            icon = icon("female"),
            color = "green"
        )
    })
    
    
    ### Total Hospitalizados ------------
 
    
    output$totalHospitalizados <- renderInfoBox({
        infoBox(
            "Hospitalizados", 
            tags$p(TOTAL_HOSPITALIZADOS$CANTIDAD, style = "font-size: 200%;"),
            icon = icon("hospital"),
            color = "purple"
        )
    })
 
    output$totalHospitalizadosHombre <- renderInfoBox({
        infoBox(
            "Hombres", 
            tags$p(TOTAL_HOSPITALIZADOS_HOMBRE$CANTIDAD, style = "font-size: 200%;"),
            icon = icon("male"),
            color = "purple"
        )
    })
    
    output$totalHospitalizadosMujer <- renderInfoBox({
        infoBox(
            "Mujeres", 
            tags$p(TOTAL_HOSPITALIZADOS_MUJER$CANTIDAD, style = "font-size: 200%;"),
            icon = icon("female"),
            color = "purple"
        )
    })    
    ### Total UCI------------
    
    
    output$totalUCI <- renderInfoBox({
      infoBox(
        "UCI", 
        tags$p(TOTAL_UCI$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("procedures"),
        color = "maroon"
      )
    })
    
    output$totalUCIHombre <- renderInfoBox({
      infoBox(
        "Hombres", 
        tags$p(TOTAL_UCI_HOMBRE$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("male"),
        color = "maroon"
      )
    })
    
    output$totalUCIMujer <- renderInfoBox({
      infoBox(
        "Mujeres", 
        tags$p(TOTAL_UCI_MUJER$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("female"),
        color = "maroon"
      )
    })     
    
    ### Total Intubados ------------
    
    
    output$totalIntubados <- renderInfoBox({
      infoBox(
        "Intubados", 
        tags$p(TOTAL_INTUBADO$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("file-medical-alt"),
        color = "teal"
      )
    })
    
    output$totalIntubadosHombre <- renderInfoBox({
      infoBox(
        "Hombres", 
        tags$p(TOTAL_INTUBADO_HOMBRE$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("male"),
        color = "teal"
      )
    })
    
    output$totalIntubadosMujer <- renderInfoBox({
      infoBox(
        "Mujeres", 
        tags$p(TOTAL_INTUBADO_MUJER$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("female"),
        color = "teal"
      )
    })     
    
    ### TOTAL DE DEFUNCIONES ---------------
        
    output$totalDefunciones <- renderInfoBox({
        infoBox(
            "Defunciones", 
            tags$p(TOTAL_DEFUNCIONES$CANTIDAD, style = "font-size: 200%;"),
            icon = icon("heartbeat"),
            color = "yellow"
        )
    })
    
    output$TotalDefuncionesHombre <- renderInfoBox({
        infoBox(
            "Hombres", 
            tags$p(TOTAL_DEFUNCIONES_HOMBRE$CANTIDAD, style = "font-size: 200%;"),
            icon = icon("male"),
            color = "yellow"
        )
    })

    output$TotalDefuncionesMujer <- renderInfoBox({
        infoBox(
            "Mujeres", 
            tags$p(TOTAL_DEFUNCIONES_MUJER$CANTIDAD, style = "font-size: 200%;"),
            icon = icon("female"),
            color = "yellow"
        )
    })   
    
    ##############################################################
    ### Capacidad Hospitalizacion ---------------
    
    output$capacidadHospitales <- renderValueBox({
      valueBox(
        "Hospitalización", 
        tags$p(paste0(round(CAPACIDAD_TLAXCALA$CAMAS_HOSPITAL,0) ," camas") , style = "font-size: 200%;"),
        icon = icon("bed"),
        color = "purple"
      )
    })
    
    output$capacidadUCI <- renderValueBox({
      
      valueBox(
        "Unidad de Cuidados Intensivos", 
        tags$p(paste0(round(CAPACIDAD_TLAXCALA$CAMAS_UCI,0) ," camas"), style = "font-size: 200%;"), 
        icon = icon("procedures"),
        color = "maroon"
      )
    })  
    
    
    output$porcentajeCapacidadUCI <- renderValueBox({
      capacidadUCI <- 100*(CAPACIDAD_TLAXCALA$CAMAS_UCI - TOTAL_UCI$CANTIDAD)/CAPACIDAD_TLAXCALA$CAMAS_UCI
      valueBox(
        "Disponible UCI", 
        tags$p(paste0(round(capacidadUCI,0) , " %") , style = "font-size: 200%;"), 
        icon = icon("procedures"),
        color = "maroon"
      )
    })
    
    output$porcentajeCapacidadHospitalizados <- renderValueBox({
      capacidadHospitalizacion <- 100*(CAPACIDAD_TLAXCALA$CAMAS_HOSPITAL - TOTAL_HOSPITALIZADOS$CANTIDAD)/ CAPACIDAD_TLAXCALA$CAMAS_HOSPITAL
      valueBox(
        "Disponible", 
        tags$p(paste0(round(capacidadHospitalizacion,0) , " %"), style = "font-size: 200%;"), 
        icon = icon("bed"),
        color = "purple"
      )
    })  
    
    
    
    #############################################################
    ### Tiempo Contagios ---------------
    
    output$tiempoContagios <- renderInfoBox({
      TIEMPO_CONTAGIOS <-  COVID19_Mexico %>% 
        filter( ENTIDAD_UM == "TLAXCALA" & RESULTADO == "Positivo SARS-CoV-2" & FECHA_INGRESO <= input$DatesMerge ) %>% 
        group_by(ENTIDAD_UM ) %>% 
        summarise(CANTIDAD = n())
      
      infoBox(
        "TOTAL DE CONTAGIOS", 
        tags$p(TIEMPO_CONTAGIOS$CANTIDAD, style = "font-size: 200%;"), 
        icon = icon("notes-medical"),
        color = "blue"
      )
    })
    
    
    
    ### Otros padecimientos de los fallecidos ---------------
    ### Obesidad ------------------
    output$totalFallecidosObesidad <- renderInfoBox({
      infoBox(
        "Obesidad",
        tags$p(TOTAL_FALLECIDOS_OBESIDAD$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("users"),
        color = "olive"
      )
      
    })    
    
    output$totalFallecidosHipertencion <- renderInfoBox({
      infoBox(
        "Hipertensión",
        tags$p(TOTAL_FALLECIDOS_HIPERTENSION$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("users"),
        color = "olive"
      )
      
    })    

    output$totalFallecidosDiabetes <- renderInfoBox({
      infoBox(
        "Diabetes",
        tags$p(TOTAL_FALLECIDOS_DIABETES$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("users"),
        color = "olive"
      )
      
    })    
    
    output$totalFallecidosCardiovascular <- renderInfoBox({
      infoBox(
        "Cardiovascular",
        tags$p(TOTAL_FALLECIDOS_CARDIOVASCULAR$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("users"),
        color = "olive"
      )
      
    })    
    output$totalFallecidosRenalCronica <- renderInfoBox({
      infoBox(
        "Renal Córonica",
        tags$p(TOTAL_FALLECIDOS_RENAL_CRONICA$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("users"),
        color = "olive"
      )
    })
       
    output$totalFallecidosTabaquismo <- renderInfoBox({
      infoBox(
        "Tabaquismo",
        tags$p(TOTAL_FALLECIDOS_TABAQUISMO$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("users"),
        color = "olive"
      )
      
    })    
    
         
    ### Otros padecimientos de los infectados ---------------
      ### Obesidad ------------------
    output$totalObesidad <- renderInfoBox({
      infoBox(
        "Obesidad",
        tags$p(TOTAL_OBESIDAD$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("users"),
        color = "olive"
      )
      
    })
    
    output$totalObesidadHombre <- renderInfoBox({
      infoBox(
        "Hombres",
        tags$p(TOTAL_OBESIDAD_HOMBRE$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("male"),
        color = "olive"
      )
      
    })
    
    output$totalObesidadMujer <- renderInfoBox({
      infoBox(
        "Mujeres",
        tags$p(TOTAL_OBESIDAD_MUJER$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("female"),
        color = "olive"
      )
      
    })    
    
      ### Hipertencion -------------------
    
    output$totalHipertencion <- renderInfoBox({
      infoBox(
        "Hipertencion",
        tags$p(TOTAL_HIPERTENSION$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("heart"),
        color = "olive"
      )
      
    })
    
    output$totalHipertencionHombre <- renderInfoBox({
      infoBox(
        "Hombres",
        tags$p(TOTAL_HIPERTENSION_HOMBRE$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("male"),
        color = "olive"
      )
      
    })
    
    output$totalHipertencionMujer <- renderInfoBox({
      infoBox(
        "Mujeres",
        tags$p(TOTAL_HIPERTENSION_MUJER$CANTIDAD, style = "font-size: 200%;"),
        icon = icon("female"),
        color = "olive"
      )
      
    })
    
    
    
    ### MAPA DE CONTAGIOS TLAXCALA ---------------
    
    output$distPlot <- renderLeaflet({
        # generate bins based on input$bins from ui.R
        p <- p %>% setView(lng = -98.2481,
                         lat = 19.4167,
                         zoom = 9)
        p
    })
  

    
    #Tabla se enfermos por municipio -------------
    output$table <- DT::renderDataTable(DT::datatable({
        ENFERMOS_MUNICIPIO
    }))
    
    #histograma enfermos por municipio -------------
    output$histMunicipios <- renderPlot({

        p <- df_mxmunicipio_TLX %>% filter(CANTIDAD > 10) %>%  mutate(municipio_name = fct_reorder(municipio_name, desc(CANTIDAD))) %>%
            ggplot( aes(x=municipio_name,y=CANTIDAD,fill=municipio_name)) + 
            geom_bar(stat = "identity") + 
            geom_text(aes(label=CANTIDAD),position=position_dodge(width=0.9),size=5, vjust=0) +
            xlab(input$variable) + labs(title="Contagios por municipio") + 
            theme(axis.text.x=element_text(angle =- 45, vjust = 0.5)) + 
            theme(legend.position="none")
        plot(p)        
    })   
    
    #histograma tasa de contagio por municipio -------------
    output$histTasaMunicipios <- renderPlot({
        p <- df_mxmunicipio_TLX %>% filter(CANTIDAD > 10) %>%  mutate(municipio_name = fct_reorder(municipio_name, desc(CANTIDAD))) %>%
            ggplot( aes(x=municipio_name,y=(CANTIDAD*1000/pop),fill=municipio_name)) + 
            geom_bar(stat = "identity") + 
            geom_text(aes(label=round((CANTIDAD*1000/pop),2)),position=position_dodge(width=0.9),size=5, vjust=0) +
            xlab(input$variable) + labs(title="Tasa de Contagios en Municipio con mas de diez contagios (Por Cada 1,000 habitantes)") + 
            theme(axis.text.x=element_text(angle =- 45, vjust = 0.5)) + ylab("Tasa de contagios por 1,000 habitantes") +
            theme(legend.position="none")
        plot(p)        
    })      
    
    
    output$esperaIngresoTex <- renderValueBox({
      valueBox(
        "General", 
        tags$p(paste0(round(TIEMPO_INGRESO$PROMEDIO_ESPERA_INGRESO,1)," días"), style = "font-size: 200%;"),
        icon = icon("calendar"),
        color = "purple"
      )
    })
        
    output$esperaIngreso <- renderValueBox({
        valueBox(
            "Fallecidos", 
            tags$p(paste0(round(TIEMPO_INGRESO_DEFUNCION$PROMEDIO_ESPERA_INGRESO,1)," días") , style = "font-size: 200%;"),
            icon = icon("calendar"),
            color = "purple"
        )
    })
    
    ## Edad de personas fallecidad -------------
    
    output$edadMenorDefuncion <- renderValueBox({
      valueBox(
        "Menor Edad", 
        tags$p(paste0(EDAD_DEFUNCION$MENOR_EDAD," años") , style = "font-size: 200%;"),
        icon = icon("calendar"),
        color = "purple"
      )
    })
    
    output$edadMayorDefuncion <- renderValueBox({
      valueBox(
        "Mayor Edad", 
        tags$p(paste0(EDAD_DEFUNCION$MAYOR_EDAD," años") , style = "font-size: 200%;"),
        icon = icon("calendar"),
        color = "purple"
      )
    })    
    
    # Tiempo que Tarda en Fallecer un infectado ---------------
    
    output$esperaDefuncion <- renderValueBox({
        valueBox(
            "Tiempo promedio", 
            tags$p(paste0(round(TIEMPO_DEFUNCION$PROMEDIO_ESPERA_DECUNCION,1)," días") , style = "font-size: 200%;"),
            icon = icon("calendar"),
            color = "purple"
        )
    })
    
    ## Histograma Contagio por Institucion ---------------
    
      
        
    output$distContagiados <- renderPlot({
        p <- ggplot(COVID19_SECTOR, aes(x=SECTOR,y=CANTIDAD,fill=SECTOR)) + 
            geom_bar(stat = "identity") + 
            geom_text(aes(label=CANTIDAD),position=position_stack( vjust=0.5),size=5) +
            xlab(input$variable) + labs(title="Pacientes con resultado positivo") + 
          theme(legend.position="none")
        plot(p)
    })
    

    
    output$distIntubados <- renderPlot({
        p <- ggplot(COVID19_INTUBADO, aes(x=SECTOR,y=CANTIDAD,fill=SECTOR)) + 
            geom_bar(stat = "identity") + 
            geom_text(aes(label=CANTIDAD),position=position_stack( vjust=0.5), size=5) +
            xlab(input$variable) + labs(title="Pacientes intubados") + 
          theme(legend.position="none")
        plot(p)
    })

    output$distUCI <- renderPlot({
      p <- ggplot(COVID19_UCI, aes(x=SECTOR,y=CANTIDAD,fill=SECTOR)) + 
        geom_bar(stat = "identity") + 
        geom_text(aes(label=CANTIDAD),position=position_stack( vjust=0.5), size=8) +
        xlab(input$variable) + labs(title="Pacientes en UCI") + 
        theme(legend.position="none")
      plot(p)
    })       
    
    output$distHospitalizados <- renderPlot({
        p <- ggplot(COVID19_HOSPITALIZADO, aes(x=SECTOR,y=CANTIDAD,fill=SECTOR)) + 
            geom_bar(stat = "identity") + 
            geom_text(aes(label=CANTIDAD),position=position_stack( vjust=0.5),size=10) +
            xlab(input$variable) + labs(title="Pacientes hospitalizados") + 
          theme(legend.position="none")
        plot(p)
    })
    
  
    
    output$distDefunciones <- renderPlot({
        p <- ggplot(COVID19_DEFUNCION, aes(x=SECTOR,y=CANTIDAD,fill=SECTOR)) + 
            geom_bar(stat = "identity") + 
            geom_text(aes(label=CANTIDAD),position=position_stack( vjust=0.5),size=10) +
            xlab(input$variable) + labs(title="Defunciones por institución") + 
          theme(legend.position="none")
        plot(p)
    })    
        
}
