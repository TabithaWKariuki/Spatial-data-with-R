

# install.packages("ggplot")

# Loading the libraries
library(sf)
library(ggplot2)
library(ggmap)
library(leaflet)

# Reading the shapefile
wosi <- st_read('C:/Users/User/Downloads/Wosi/Wosiwosi Village.shp')
wosi


# Checking layers
shp <- "Wosiwosi Village.shp"
st_layers(shp)


# Ploting the points
ggplot() +
  geom_sf(data = wosi, size = 3, color = 'blue', fill = 'cyan1') +
  ggtitle('Wosiwosi') +
  coord_sf()


# Ploting the points
leaflet() %>% 
  addTiles() %>% 
  addMarkers(data = wosi)
