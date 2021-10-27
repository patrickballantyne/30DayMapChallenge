# 30DayMapChallenge

This repo contains my efforts at the annual #30DayMapChallenge:
- **2021**: **3D** - Visualisation of Starbucks locations in Florida.
- **2020**: **Hexagons** - COVID-19 retail patterns in Chicago.


## 2021

Using the SafeGraph core places dataset, I mapped the locations of all Starbucks coffee shops in Florida state, aggregated to H3. The locations were extracted and joined to a hexagonal grid of Florida, created using the ['h3jsr R packag'](https://github.com/obrl-soil/h3jsr), before being mapped with ggplot and converted to 3D using the ['rayshader R package'](https://www.rayshader.com).

Code used to produce the map can be found ['here']() - built mostly with ggplot, sf and rayshader. 



## 2020

I made this quick gif here to illustrate changes in mobility around retail stores prior to and during the first peak of the COVID-19 pandemic. Using the 'core places' and 'weekly patterns' datasets from SafeGraph, which can be accessed [here](https://www.safegraph.com/covid-19-data-consortium), i aggregated individual store patterns to H3 geometries (hexagons) using the ['h3jsr'](https://github.com/obrl-soil/h3jsr) R package and have animated a subset of these from the last week of February, to early April.

Code for the map can be found [here](Patterns_Hexmap.R) - built mostly with tmap & sf, with additional functions provided by h3jsr (for H3 geometries), ceramic (static carto basemap) and magick (assemblage of GIF).


   <p align="center">
  <img width="350" height="500" src="retailpatterns_hexmap.gif">
</p>

