#load libraries
library(sf)
library(ggmap)
library(ggplot2)

#read file
nai <- st_read("nairobi_roads_2010.shp")

#check attribute
names(nai)

#indicate the names
nai$NAME

nai$geometry

library(dplyr)

#extract roads using names

roads_nai <- nai%>%
  filter(NAME == "NGONG ROAD")
nrow(roads_nai)

ggplot() + 
  geom_sf(data = nai) +
  ggtitle("Nairobi_roads", subtitle = "Roads") + 
  coord_sf()


ggplot() + 
  geom_sf(data = nai, aes(color = factor(OBJECTID)), size = 1.5) +
  ggtitle("Nairobi_Roads", subtitle = "Roads") + 
  coord_sf()
