

library(sf)
library(osmdata)
library(dplyr)
library(ggplot2)
library(ggmap)
library(leaflet)


get_roads <- function(city){
  get_streets <- getbb(city)%>%
    opq()%>%
    add_osm_feature(key = "highway",
                    value = c("primary", "secondary")) %>%
    osmdata_sf()
  
  
  rbind(
    get_streets$osm_lines,
    get_streets$osm_multilines
  )
  
  return(get_streets)
}



get_roads('Nairobi')

