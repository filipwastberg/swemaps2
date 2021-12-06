library(tidyverse)
library(janitor)
library(sf)

## Sthlm

url <- "https://dataportalen.stockholm.se/dataportalen/Data/Stadsledningskontoret/Basomraden.zip"

temp <- tempdir()

download.file(url, destfile = glue::glue("data-raw/Basomraden.zip"))

## unzip(glue::glue("{temp}/Basomraden.zip"), exdir = glue::glue("{temp}/sthlm_basomraden"))
## Does not work because of encoding issues, I use manual unzip instead.

files <- list.files("data-raw/Basomraden")

shp <- files[str_detect(files, ".shp")]

sthlm <- read_sf("data-raw/Basomraden/Statistikomr†de_polygons.shp") %>% 
  janitor::clean_names()

sthlm_points <- read_sf("data-raw/Basomraden/Statistikomr†de_text_points.shp") %>% 
  janitor::clean_names()

#save(sthlm_points, sthlm, file = "data/sthlm_basomraden.rda")

ggplot(sthlm, aes(fill = man_45_64_1)) +
  geom_sf()

library(simplevis)

leaflet_sf_col(sthlm, col_var = man_45_64_1)

## Göteborg

url <- "https://goteborg.se/wps/wcm/connect/ea122cc3-8ea1-49ea-9e4b-91a789833f51/BO_2021_shp.zip?MOD=AJPERES"

download.file(url, destfile = glue::glue("data-raw/gbg_basomraden.zip"))

#unzip("data-raw/gbg_basomraden.zip",exdir = "data-raw/gbg_basomraden")
## Does not work because of encoding issues, I use manual unzip instead.

files <- list.files("data-raw/BO_2021_shp")

shp <- files[str_detect(files, ".shp")]

gbg <- read_sf("data-raw/BO_2021_shp/BASOMR\u008fDEN_2021_XU_region.shp") %>% 
  janitor::clean_names()

#save(gbg, file = "data/gbg_basomraden.rda")

ggplot(gbg, aes(fill = area_km2)) +
  geom_sf()

gbg %>% 
  filter(is.na(geometry))

leaflet_sf(gbg)

## Malmö
url <- "https://ckan-malmo.dataplatform.se/dataset/fa574631-e811-48c7-afa6-fd402815b4eb/resource/d1e3bf75-731e-4225-82b8-7299cfb56499/download/delomr_p_3008.zip"

download.file(url, destfile = glue::glue("data-raw/malmo_delomraden.zip"))

unzip("data-raw/malmo_delomraden.zip",exdir = "data-raw/malmo_delomraden")

list.files("data-raw/malmo_delomraden")

malmo <- read_sf("data-raw/malmo_delomraden/delomr_p_3008.shp")

leaflet_sf_col(malmo, col_var = area)

save(gbg, sthlm, sthlm_points, malmo, file = "data/city-maps.rda", compress = "xz")

files <- list.files("data-raw")

files_to_remove <- paste0("data-raw/", files[!(files %in% c("sweref99.R", "city-maps.R"))])

map(files_to_remove, ~unlink(., recursive = TRUE))


