library(googleVis)

suppressPackageStartupMessages(library(googleVis))
options(gvis.plot.tag='chart')
M <- gvisMotionChart(Fruits, "Fruit", "Year", options = list(width=600, height=400))
# print(M, file="myGoogleVisChart.html")
plot(M)



G <- gvisGeoChart(Exports, locationvar = "Country", colorvar = "Profit", 
                  options = list(width = 600, height=400))
plot(G)








