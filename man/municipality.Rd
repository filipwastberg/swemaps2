% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{municipality}
\alias{municipality}
\title{SF object with municipality borders in Sweden}
\format{
SF object with 3 columns
\describe{
  \item{kn_kod}{a character with municipality ID}
  \item{kn_namn}{a character with municipality name}
  \item{ln_kod}{a character with region ID}
  \item{ln_namn}{a character with region name}
  \item{geometry}{a multipolygon with municipality borders}
}
}
\source{
{SCB, https://www.scb.se/hitta-statistik/regional-statistik-och-kartor/regionala-indelningar/digitala-granser/}
}
\usage{
municipality
}
\description{
Includes polygon and regional IDs for municipalities in Sweden
}
\keyword{datasets}
