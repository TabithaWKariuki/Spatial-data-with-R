
library(sf)
library(osmdata)
library(dplyr)
library(ggplot2)
library(ggmap)
library(leaflet)
library(stringr)


get_roads <- function(city, 
                      value = c("primary", "secondary", "trunk")){
  

  value <-if(any(str_detect(value,"All"))){NULL} else {value}
  
  get_streets <- getbb(city)%>%
    opq()%>%
    add_osm_feature(key = "highway",
                    value = value) %>%
    osmdata_sf()
  
  
allroads<- rbind(
    get_streets$osm_lines,
    get_streets$osm_multilines
  )
  
  return(allroads)
}


nairobi_roads <- get_roads('Nairobi', value = c("All"))

mapview::mapview(nairobi_roads)
