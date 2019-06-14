## Leaflet is one the most popular JS libraries for creating interactive maps. The leaflet R package allows to create own leaflet 
## maps without needing to know any Javascript!


library(leaflet)

# leaflet() function creates a map widget that you can store in variable so that you can modify the map later on.
# addTiles() function adds mapping data from "Open Street Map"
my_map <- leaflet() %>% 
  addTiles()
my_map


# addMarkers() function adds point on the map with popup message
my_map <- my_map %>% 
  addMarkers(lat = 47.094711, lng = 37.528369, popup = "My Mariupol's Home") %>% 
  addMarkers(lat = 50.014080, lng = 36.339833, popup = "My Kharkiv's home")
my_map
  

# Adding many markers
set.seed(2016-04-25)
df <- data.frame(lat = runif(3, min = 39.2, max = 39.3),
                 lng = runif(3, min = -76.6, max = -76.5),
                 text = c("Hello", "Nastya", "World"))

df %>% 
  leaflet() %>% 
  addTiles() %>% 
  addMarkers(popup = df$text)

# Adding Custom Markets
dog <- makeIcon(
  iconUrl = "https://png.pngtree.com/png_detail/20181019/white-dog-png-clipart_1871776.png",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230, iconAnchorY = 16
)
parrot <- makeIcon(
  iconUrl = "/Users/avyny/Shiny:Plotly:Leaflet/pics/IMG_4459.JPG",
  iconWidth = 31*215/230, iconHeight = 31,
  iconAnchorX = 31*215/230, iconAnchorY = 16
)

my_map %>% 
  leaflet() %>% 
  addTiles() %>% 
  addMarkers(lat = 47.094711, lng = 37.528369, popup = "My Mariupol's Home", icon = dog) %>% 
  addMarkers(lat = 50.014080, lng = 36.339907, popup = "Sheldon's Home", icon = parrot)


## Adding References on Markers
Sites <- c(
  "<a href='https://ru.wikipedia.org/wiki/%D0%9C%D0%B0%D1%80%D0%B8%D1%83%D0%BF%D0%BE%D0%BB%D1%8C'>Info about Mariupol</a>",
  "<a href='https://www.youtube.com/watch?v=4ItXImQTeXE'>Друг Шелдона</a>"
)
df <- data.frame(lat = c(47.094711, 50.014080),
                 lng = c(37.528369, 36.339907))
df %>% 
  leaflet() %>% 
  addTiles() %>% 
  addMarkers(icon = parrot, popup = Sites)


## Sometimes we have so many points on a map that it doesn't make sense to plot every marker. In these situations leaflet allows
## to plot clusters of markers, using: addMarkers(clusterOptions = markerClusterOptions())
## When we zoom in to each cluster, the clusters will separate until you can see the individual markers.

df <- data.frame(lat = runif(500, min = 39.25, max = 39.35),
                 lng = runif(500, min = -76.65, max = -76.55))

df %>% 
  leaflet() %>% 
  addTiles() %>% 
  addMarkers(clusterOptions = markerClusterOptions())

## Adding Circle Markers (Just Markers looks like blue circles, that's it)
df <- data.frame(lat = runif(20, min = 39.25, max = 39.35),
                 lng = runif(20, min = -76.65, max = -76.55))
df %>% 
  leaflet() %>% 
  addTiles %>% 
  addCircleMarkers() 


## Draw circle, which proportional to number that it has.
## The code below draws a map where the circle on each city is proportional to the population of that city

md_cities <- data.frame(name = c("Baltimore", "Frederick", "Rockville", "Gaithersburg", "Bowie", "Hagerstown", "Annapolis", "College Park",
                                 "Salisbury", "Laurel"),
                        pop = c(619493, 66169, 62334, 61045, 55232, 39890, 38880, 30587, 30484, 25346),
                        lat = c(39.2920592, 39.4143921, 39.0840, 39.1434, 39.0068, 39.6418, 39.9784, 38.9897, 38.3607, 39.0993),
                        lng = c(-76.6077852, -77.4204875, -77.1528, -77.2014, -76.7791, -77.7200, -76.4922, -76.9378, -75.5994, -76.8483)
                        )

md_cities %>% 
  leaflet() %>% 
  addTiles() %>% 
  addCircles(weight = 3, radius = sqrt(md_cities$pop) * 30)


## Adding Rectangles

leaflet() %>% 
  addTiles() %>% 
  addRectangles(lat1 = 37.3858, lng1 = -122.0595,
                lat2 = 37.3890, lng2 = -122.0625)


## Adding Titles (adding dif colors of markers and legend what they mean)
# Adding a legend can be useful if you have markers on your map with different colors.

df <- data.frame(lat = runif(20, min = 39.25, max = 39.35),
                 lng = runif(20, min = -76.65, max = -76.55),
                 col = sample(c('red', 'blue', 'green'), 20, replace = T),
                 stringsAsFactors = F)

df %>% 
  leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(color = df$col) %>% 
  addLegend(labels = LETTERS[1:3], colors = c("blue", "red", "green"))


