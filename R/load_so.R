#' Load DeSO polgyons 
#' 
#' Function to read Swedish Demografiska statistikomraden (DeSO) 
#' @importFrom stringr str_extract str_remove
#' @importFrom janitor clean_names
#' @importFrom sf st_read
#' @importFrom glue glue
#' @importFrom dplyr rename
#' @importFrom utils download.file unzip
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
#' 
load_deso <- function(){
  
  temp <- tempdir()
  url <- "https://www.scb.se/contentassets/923c3627a8a042a5b9215e8ff3bde0a3/deso_2018_2021-10-21.zip"
  
  zip_name <- stringr::str_extract(url, "([^/]+.zip)")
  
  download.file(url, destfile = glue::glue("{temp}/{zip_name}"), quiet = FALSE)
  
  file_name <- stringr::str_remove(zip_name, ".zip")
  
  unzip(glue::glue("{temp}/{zip_name}"),
        exdir = glue::glue("{temp}/{file_name}"))
  

  file <- list.files(glue::glue("{temp}/{file_name}"), full.names = TRUE)
  
  sf::st_read(file) %>% 
    dplyr::rename(geometry = geom)
  
}
#' Load RegSO polygons 
#' 
#' Function to read Swedish regionala statistikomrden (RegSO) 
#' 
#' @importFrom stringr str_extract str_remove
#' @importFrom janitor clean_names
#' @importFrom sf st_read
#' @importFrom glue glue
#' @importFrom dplyr rename
#' @importFrom utils download.file unzip
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
load_regso <- function(){
  
  temp <- tempdir()
  url <- "https://www.scb.se/contentassets/e3b2f06da62046ba93ff58af1b845c7e/regso_2018_v1_20211103.zip"
  
  zip_name <- stringr::str_extract(url, "([^/]+.zip)")
  
  try_download <- download.file(url, destfile = glue::glue("{temp}/{zip_name}"))
  
  file_name <- stringr::str_remove(zip_name, ".zip")
  
  unzip(glue::glue("{temp}/{zip_name}"), exdir = glue::glue("{temp}/{file_name}"))
  
  file <- list.files(glue::glue("{temp}/{file_name}"), full.names = TRUE)
  
  sf::st_read(file) %>% 
    dplyr::rename(geometry = geom)
}