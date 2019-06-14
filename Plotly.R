library(plotly)

# simple interactive plot with "plotly"
plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers")

#### if we want to save this plot as interactive plot, we can do it by 
# pressing Export -> Save as Web Page

# In the next example we can add argument "color" and assign to this argument factor variable.
# We will see points with different colors, depending on groups.
plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers", color = ~as.factor(cyl))

# We can also color continuous variable.
plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers", color = ~disp)

# Changing the size of points, depending on other variable
plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers", color = ~as.factor(cyl), size = ~hp)

# Or we can assign specific value for size
plot_ly(mtcars, x = ~wt, y = ~mpg, mode = "markers", color = ~as.factor(cyl), size = 5)

# 3D scatterplot
# We can create a three-dimensional scatterplot with the "type = "scatter3d"" argument. If click and drag these scatterplots, we can 
# view them from dif sides.

set.seed(2016-07-21)
temp <- rnorm(100, mean = 30, sd = 5)
pressue <- rnorm(100)
dtime <- 1:100
plot_ly(x = temp, y = pressue, z = dtime, type = "scatter3d", mode = "markers", color = temp)


#  Plotting data from time series (!)
# data('airmiles') is the time series from 1937 to 1960 with some info in this year
# linetype = I("solid") connect all points in plot with lines. There are different types of lines in documnetation.
data('airmiles')
plot_ly(x = time(airmiles), y = airmiles, linetype = I("solid"))


# Multi-Line Graph
# In this graph there are statistics with dif indexes on the same date-time from 1992 to 1999 years.
library(plotly)
library(tidyr)
library(dplyr)
data('EuStockMarkets')

stocks <- as.data.frame(EuStockMarkets) %>% 
  gather(index, price) %>% 
  mutate(time = rep(time(EuStockMarkets), 4))

plot_ly(stocks, x = ~time, y = ~price, color = ~index)

# Histogram
plot_ly(x = ~mtcars$disp, type = "histogram")

# Boxplot
# Looks great
plot_ly(iris, y = ~Petal.Length, color = ~Species, type = "box")

# 3D Surface
# Looks like a picture that usually illustrates when explains "gradient descend"
ter <- matrix(sort(rnorm(100*100)), nrow = 100, ncol = 100)
plot_ly(z = ter, type = "surface")

# Plot on map (interactive map)

state_pop <- data.frame(State = state.abb, Pop = as.vector(state.x77[,1]))
state_pop$hover <- with(state_pop, paste(State, '<br>', "Population:", Pop))
borders <- list(color = toRGB("red"))
map_options <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = T,
  lakecolor = toRGB('white')
)
plot_ly(state_pop, z = ~Pop, text = ~hover, locations = ~State, type = 'choropleth', locationmode = 'USA-states', 
        color = ~Pop, colors = "Blues", marker = list(line = ~borders)) %>% 
  layout(title = "US Population in 1975", geo = map_options)








