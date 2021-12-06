#' Clean theme for maps
#'
#' A clean theme that is good for displaying maps from swemaps2
#'
#' @inheritParams ggplot2::theme_grey
#' @export
#' @importFrom ggplot2 %+replace%
theme_swemap <- function(base_size = 9, base_family = "") {
  ggplot2::theme_bw(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(axis.line = ggplot2::element_blank(),
          axis.text = ggplot2::element_blank(),
          axis.ticks = ggplot2::element_blank(),
          axis.title = ggplot2::element_blank(),
          panel.background = ggplot2::element_blank(),
          panel.border = ggplot2::element_blank(),
          panel.grid = ggplot2::element_blank(),
          panel.spacing = ggplot2::unit(0, "lines"),
          plot.background = ggplot2::element_blank()
    )
}
