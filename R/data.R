#' SF object with county borders in Sweden
#'
#' Includes polygon and regional IDs for counties in Sweden
#'
#' @format SF object with 3 columns
#' \describe{
#'   \item{ln_kod}{a character with county ID}
#'   \item{ln_namn}{a character with county name}
#'   \item{geometry}{a multipolygon with county borders}
#' }
#' @source {SCB, https://www.scb.se/hitta-statistik/regional-statistik-och-kartor/regionala-indelningar/digitala-granser/}
"county"

#' SF object with municipality borders in Sweden
#'
#' Includes polygon and regional IDs for municipalities in Sweden
#'
#' @format SF object with 3 columns
#' \describe{
#'   \item{kn_kod}{a character with municipality ID}
#'   \item{kn_namn}{a character with municipality name}
#'   \item{ln_kod}{a character with region ID}
#'   \item{ln_namn}{a character with region name}
#'   \item{geometry}{a multipolygon with municipality borders}
#' }
#' @source {SCB, https://www.scb.se/hitta-statistik/regional-statistik-och-kartor/regionala-indelningar/digitala-granser/}
"municipality"

#' SF object with FA region borders in Sweden
#'
#' Includes polygon and regional IDs for FA regions in Sweden
#'
#' @format SF object with 3 columns
#' \describe{
#'   \item{fa_kod}{a character with FA region ID}
#'   \item{fa_namn}{a character with FA region name}
#'   \item{geometry}{a multipolygon with FA region borders}
#' }
#' @source {SCB, https://www.scb.se/hitta-statistik/regional-statistik-och-kartor/regionala-indelningar/digitala-granser/}
"fa_region"

#' SF object with borders in Stockholm
#'
#' Includes polygon and metadata about Stockholm
#'
#' @format SF object with 62 columns
#' \describe{
#'   \item{namn}{a character with region name}
#'   \item{nyckelkod}{a number with key}
#'   \item{geometry}{a multipolygon with region borders}
#' }
#' @source {Stockholm stad, https://dataportalen.stockholm.se}
"sthlm"

#' SF object with region points in Stockholm
#'
#' Includes st points and metadata about Stockholm
#'
#' @format SF object with 66 columns
#' \describe{
#'   \item{namn}{a character with region name}
#'   \item{nyckelkod}{a number with key}
#'   \item{geometry}{a multipolygon with region borders}
#' }
#' @source {Stockholm stad, https://dataportalen.stockholm.se}
"sthlm_points"

#' SF object with borders in Gothenburg
#'
#' Includes polygon and metadata about Gothenburg
#'
#' @format SF object with 4 columns
#' \describe{
#'   \item{ajour_datu}{a date describing last update}
#'   \item{basomrade}{a character describing area code}
#'   \item{area_km2}{a number describing area size in km2}
#'   \item{geometry}{a multipolygon with region borders}
#' }
#' @source {Goteborg stad, http://statistikdatabas.goteborg.se/pxweb/sv/}
"gbg"

#' SF object with borders in Malmo
#'
#' Includes polygon and metadata about Malmo
#'
#' @format SF object with 4 columns
#' \describe{
#'   \item{delomrade}{a character with region name}
#'   \item{do_kod}{a number with id code?}
#'   \item{area}{a number describing area size}
#'   \item{geometry}{a multipolygon with region borders}
#' }
#' @source {Malmo stad, https://malmo.dataplatform.se/}
"malmo"
