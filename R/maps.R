#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#




df_mxmunicipio_TLX$CANTIDAD[is.na(df_mxmunicipio_TLX$CANTIDAD)  ] <- 0
df_mxmunicipio_TLX$value <-  df_mxmunicipio_TLX$CANTIDAD


regiones <- unique(df_mxmunicipio_TLX$regiones)

#p <- mxmunicipio_choropleth(df_mxmunicipio_TLX, num_colors = 1,
#                            zoom = df_mxmunicipio_TLX$region,S
#                            show_states = FALSE,
#                            legend = "Contagios")

magma <- c("#80E375FF", "#4CB240FF", "#B29340FF", "#CE1D1DFF")
pal <- colorNumeric(magma, domain = df_mxmunicipio_TLX$value)

p <- mxmunicipio_leaflet(df_mxmunicipio_TLX,
                         pal,
                         ~ pal(value),
                         ~ sprintf("Estado: %s<br/>Municipio : %s<br/>Contagios: %s",
                                   state_name, municipio_name, value),  zoom = df_mxmunicipio_TLX$region ) %>%
  addLegend(position = "bottomright", pal = pal,
            values = df_mxmunicipio_TLX$value) %>%
  addProviderTiles("CartoDB.Positron")


labels <- df_mxmunicipio_TLX 
  
labels$group <- NA
labels <- subset(labels, value >0)

