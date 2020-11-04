# COVID-19 Retail Patterns - #30DayMapChallenge

I made this quick gif here to illustrate changes in mobility around retail stores prior to and during the first peak of the COVID-19 pandemic. Using the 'core places' and 'weekly patterns' datasets from SafeGraph, which can be accessed [HERE](https://www.safegraph.com/covid-19-data-consortium), I aggregated individual store patterns to H3 geometries (hexagons) using the ['h3jsr'](https://github.com/obrl-soil/h3jsr) R package and have animated a subset of these from the last week of February, to early April.

Code for the map can be found [HERE](Patterns_Hexmap.R) - built mostly with tmap & sf, with additional functions provided by h3jsr (for H3 geometries), ceramic (static carto basemap) and magick (assemblage of GIF).


   <p align="center">
  <img width="350" height="500" src="retailpatterns_hexmap.gif">
</p>

## Acknowledgements

* Thanks to SafeGraph for provision of their data through their COVID-19 Data Consortium. 
* Thanks also to Robin Lovelace/Jakub Nowosad and Lex Comber/Chris Brunsdon, their respective books "Geocomputation in R"/"Introduction to R for Spatial Analysis and Mapping" have proven invaluable for everything 'spatial' in R. Available [HERE](https://geocompr.robinlovelace.net/index.html) and [HERE](https://bookdown.org/lexcomber/brunsdoncomber2e/)
