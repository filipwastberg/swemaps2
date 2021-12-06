library(tidyverse)
library(janitor)
library(sf)

download.file("https://www.scb.se/contentassets/3443fea3fa6640f7a57ea15d9a372d33/shape_svenska.zip", destfile = "data-raw/shape_svenska.zip")

unzip("data-raw/shape_svenska.zip", exdir = "data-raw/shape_svenska")

unzip("data-raw/shape_svenska/LanRT90.zip", exdir = "data-raw/lan_rt90")

## Function to extract files
extract_shape <- function(file){
  path <- glue::glue("data-raw/{file}")
  
  to_dir <- paste0("data-raw/", snakecase::to_snake_case(str_remove(file, ".zip")))
  
  unzip(glue::glue("data-raw/shape_svenska/{file}"), exdir = to_dir)
  
  files <- list.files(to_dir)
  
  shape_file <- tibble(
    files = files
  ) %>% 
    filter(str_detect(files, "shp")) %>% 
    .$files
  
  files_to_remove <- tibble(
    files = files
  ) %>% 
    filter(!str_detect(files, "shp")) %>% 
    .$files
  
}

files <- list.files("data-raw/shape_svenska")

map(files, extract_shape)

read_scb_sf <- function(folder){
  files <- list.files(folder)

  shape_file <- tibble(
    files = files
  ) %>% 
    filter(str_detect(files, "shp")) %>% 
    .$files
  
  if(isTRUE(str_detect(shape_file, ".shp"))){
    read_sf(paste0(folder, "/", shape_file)) %>% 
      janitor::clean_names()

  } else {
    NULL
  }
}

county <- read_scb_sf("data-raw/lan_sweref_99_tm")

fa_region <- read_scb_sf("data-raw/f_aregion_sweref_99_tm")

municipality <- read_scb_sf("data-raw/kommun_rt_90")

save(county, fa_region, municipality, file = "data/sweref99.rda", compress = "xz")

## Test maps
ggplot(county) +
  geom_sf()

ggplot(fa_region) +
  geom_sf()

ggplot(municipality) +
  geom_sf()

## Remove files
files <- list.files("data-raw")

files_to_remove <- paste0("data-raw/", files[!(files %in% c("sweref99.R", "city-maps.R"))])

map(files_to_remove, ~unlink(., recursive = TRUE))
