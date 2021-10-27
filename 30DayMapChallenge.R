## Libraries
library(ggplot2)
library(tidyverse)
library(sf)
library(rayshader)
library(Rcpp)
library(h3jsr)
library(Rcpp)
options(scipen = 999)


# 1.  Data ----------------------------------------------------------------

## Starbucks locations - obtained from SafeGraph core places
poi <- st_read("Data/Starbucks.gpkg")

## State borders
states <- tigris::states()
states <- states %>%
  filter(GEOID == "12") %>%
  st_transform(4326)

# 2.  Data Cleaning -------------------------------------------------------

## Polyfill state border to obtain hexagons
h3 <- polyfill(states, 5, simple = FALSE)
poly_h3 <- h3_to_polygon(unlist(h3$h3_polyfillers), simple = FALSE)

## Calculate number of Starbucks per hexagon
out <- st_join(poly_h3, poi)
out_df <- out %>%
  as.data.frame() %>%
  filter(!is.na(top_category)) %>%
  select(h3_address) %>%
  group_by(h3_address) %>%
  count(.drop = FALSE)

## Join on counts to all hexes
hexes <- merge(poly_h3, out_df, by = "h3_address", all.x = TRUE)
hexes <- hexes %>%
  select(h3_address, n) %>%
  st_cast("POLYGON") %>%
  mutate(n = replace_na(n, 0))


# 3.  Mapping -------------------------------------------------------------

## Build 2D map
n1 <- ggplot(hexes) +
  geom_sf(aes(fill = n), lwd = 0) +
  scale_fill_distiller(palette = "YlGn") +
  labs(title = "Total number of Starbucks franchises",
       caption = "Data source: Safegraph Inc - Core Places") +
  theme_minimal()

## Set up 3D map
n2 <- ggplot(hexes) +
  geom_sf(aes(fill = n), lwd = 0) +
  scale_fill_distiller(palette = "YlGn") +
  labs(fill = "n") +
  theme_minimal()

## Build 3D map
plot_gg(n2, width = 5, height = 5, multicore = TRUE, scale = 250)
render_snapshot("3D.png", clear = TRUE)

