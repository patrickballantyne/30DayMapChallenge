## 30 Day Map Challenge Code

## Libraries and Setup
library(sf)
library(tmap)
library(tidyverse)
library(h3jsr)
library(magick)
Sys.setenv(MAPBOX_API_KEY="pk.eyJ1Ijoic2dwYmFsbGEiLCJhIjoiY2tncnZxc3FqMGhzaTJ6bzcxNTk3bDNldCJ9.tYEAVCBey8y5tzXx9i0lPw")
windowsFonts("Consolas" = windowsFont("Lucida Console"))

## Safegraph Retail Points with patterns
pts <- st_read("safegraph_retail_points_and_patterns.gpkg")
pts <- pts %>%
  select(safegraph_place_id, visits1, visits2, visits3,
         visits4, visits5, visits6, visits7, visits8)
pts <- st_transform(pts, crs = 32616)

## Chicago CBD Boundary
city <- st_read("chicago_cbd.gpkg")
city <- st_transform(city, crs = 32616)


## Basemap for AoI - will not work without MapBox API key
basemap <- ceramic::cc_location(loc = city, zoom = 14,
                                base_url = "https://basemaps.cartocdn.com/rastertiles/dark_all/{zoom}/{x}/{y}.png")

## Build a H3 grid for Chicago CBD
city_h3 <- polyfill(city, res = 10, simple = FALSE)
city_h3_poly <- h3_to_polygon(unlist(city_h3$h3_polyfillers), simple = FALSE)
city_h3_poly <- st_transform(city_h3_poly, crs = 32616)

## Spatial Join Points to Grid
pts_h3 <- st_join(city_h3_poly, new_pts, join = st_contains)
pts_h3 <- pts_h3 %>%
  group_by(h3_address) %>%
  dplyr::summarise("24/02" = sum(visits1), "02/03" = sum(visits2),
                   "09/03" = sum(visits3), "16/03" = sum(visits4),
                   "23/03" = sum(visits5), "30/03" = sum(visits6),
                   "06/04" = sum(visits7), "13/04" = sum(visits8))



## 
# NOTE - If you have ImageMagick installed you should use tm_facet() and it will assemble GIF automatically
##


## If you don't have ImageMagick - build each map individually, write out and construct GIF as follows:
tm1 <- tm_shape(basemap) +
  tm_rgb() +
  tm_shape(db) +
  tm_fill(col = "24/02", style = "fixed", breaks = c(0, 250, 500, 1000, 2000, 3000, 5000),
          palette = "viridis", alpha = 0.55,
          title = "Visits to Retail Stores", colorNA = NULL) +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"),
            legend.frame = FALSE, legend.show = TRUE, title = "24th February",
            title.position = c("left", "bottom"), title.color = "white", 
            fontfamily = "Consolas", title.fontfamily = "Consolas", legend.text.color = "white",
            title.size = 1,
            legend.text.size = 0.5, legend.title.size = 0.75)
tmap_save(tm1, "week1.png")

tm2 <- tm_shape(basemap) +
  tm_rgb() +
  tm_shape(db) +
  tm_fill(col = "02/03", style = "fixed", breaks = c(0, 250, 500, 1000, 2000, 3000, 5000),
          palette = "viridis", alpha = 0.55,
          title = "Visits to Retail Stores", colorNA = NULL) +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"),
            legend.frame = FALSE, legend.show = TRUE, title = "2nd March",
            title.position = c("left", "bottom"), title.color = "white", 
            fontfamily = "Consolas", title.fontfamily = "Consolas", legend.text.color = "white",
            title.size = 1,
            legend.text.size = 0.5, legend.title.size = 0.75)
tmap_save(tm2, "week2.png")

tm3 <- tm_shape(basemap) +
  tm_rgb() +
  tm_shape(db) +
  tm_fill(col = "09/03", style = "fixed", breaks = c(0, 250, 500, 1000, 2000, 3000, 5000),
          palette = "viridis", alpha = 0.55,
          title = "Visits to Retail Stores", colorNA = NULL) +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"),
            legend.frame = FALSE, legend.show = TRUE, title = "9th March",
            title.position = c("left", "bottom"), title.color = "white", 
            fontfamily = "Consolas", title.fontfamily = "Consolas", legend.text.color = "white",
            title.size = 1,
            legend.text.size = 0.5, legend.title.size = 0.75)
tmap_save(tm3, "week3.png")

tm4 <- tm_shape(basemap) +
  tm_rgb() +
  tm_shape(db) +
  tm_fill(col = "16/03", style = "fixed", breaks = c(0, 250, 500, 1000, 2000, 3000, 5000),
          palette = "viridis", alpha = 0.55,
          title = "Visits to Retail Stores", colorNA = NULL) +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"),
            legend.frame = FALSE, legend.show = TRUE, title = "16th March",
            title.position = c("left", "bottom"), title.color = "white", 
            fontfamily = "Consolas", title.fontfamily = "Consolas", legend.text.color = "white",
            title.size = 1,
            legend.text.size = 0.5, legend.title.size = 0.75)
tmap_save(tm4, "week4.png")

tm5 <- tm_shape(basemap) +
  tm_rgb() +
  tm_shape(db) +
  tm_fill(col = "23/03", style = "fixed", breaks = c(0, 250, 500, 1000, 2000, 3000, 5000),
          palette = "viridis", alpha = 0.55,
          title = "Visits to Retail Stores", colorNA = NULL) +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"),
            legend.frame = FALSE, legend.show = TRUE, title = "23rd March",
            title.position = c("left", "bottom"), title.color = "white", 
            fontfamily = "Consolas", title.fontfamily = "Consolas", legend.text.color = "white",
            title.size = 1,
            legend.text.size = 0.5, legend.title.size = 0.75)
tmap_save(tm5, "week5.png")

tm6 <- tm_shape(basemap) +
  tm_rgb() +
  tm_shape(db) +
  tm_fill(col = "30/03", style = "fixed", breaks = c(0, 250, 500, 1000, 2000, 3000, 5000),
          palette = "viridis", alpha = 0.55,
          title = "Visits to Retail Stores", colorNA = NULL) +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"),
            legend.frame = FALSE, legend.show = TRUE, title = "30th March",
            title.position = c("left", "bottom"), title.color = "white", 
            fontfamily = "Consolas", title.fontfamily = "Consolas", legend.text.color = "white",
            title.size = 1,
            legend.text.size = 0.5, legend.title.size = 0.75)
tmap_save(tm6, "week6.png")

tm7 <- tm_shape(basemap) +
  tm_rgb() +
  tm_shape(db) +
  tm_fill(col = "06/04", style = "fixed", breaks = c(0, 250, 500, 1000, 2000, 3000, 5000),
          palette = "viridis", alpha = 0.55,
          title = "Visits to Retail Stores", colorNA = NULL) +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"),
            legend.frame = FALSE, legend.show = TRUE, title = "6th April",
            title.position = c("left", "bottom"), title.color = "white", 
            fontfamily = "Consolas", title.fontfamily = "Consolas", legend.text.color = "white",
            title.size = 1,
            legend.text.size = 0.5, legend.title.size = 0.75)
tm_save(tm7, "week7.png")

tm8 <- tm_shape(basemap) +
  tm_rgb() +
  tm_shape(db) +
  tm_fill(col = "13/04", style = "fixed", breaks = c(0, 250, 500, 1000, 2000, 3000, 5000),
          palette = "viridis", alpha = 0.55,
          title = "Visits to Retail Stores", colorNA = NULL) +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"),
            legend.frame = FALSE, legend.show = TRUE, title = "13th April",
            title.position = c("left", "bottom"), title.color = "white", 
            fontfamily = "Consolas", title.fontfamily = "Consolas", legend.text.color = "white",
            title.size = 1,
            legend.text.size = 0.5, legend.title.size = 0.75)
tmap_save(tm1, "week1.png")


## Construction of GIF
list.files(pattern = '*.png') %>%
  image_read() %>%
  image_join() %>%
  magick::image_animate(fps = 1, loop = 10) %>%
  image_write("retailpatterns_hexmap.gif")
