#' Clean theme for maps
#'
#' A clean theme that is good for displaying maps from swemaps2
#'
#' @inheritParams ggplot2::theme_grey
#' @export
#' @importFrom ggplot2 %+replace%
theme_swemap <- function(base_size = 9, base_family = "") {
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
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
#' Clean theme with gridlines for maps
#'
#' A clean theme for maps in ggplot2, but still with gridlines
#' @inheritParams ggplot2::theme_grey
#' @export
#' @importFrom ggplot2 %+replace%
theme_swemap2 <- function(base_size = 9, base_family = ""){
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      axis.line = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      # panel.grid.minor = element_line(color = "#ebebe5", size = 0.2),
      panel.grid.major = ggplot2::element_line(color = "#ebebe5", size = 0.2),
      panel.grid.minor = ggplot2::element_blank(),
      plot.background = ggplot2::element_rect(fill = "#f5f5f2", color = NA),
      panel.background = ggplot2::element_rect(fill = "#f5f5f2", color = NA),
      legend.background = ggplot2::element_rect(fill = "#f5f5f2", color = NA),
      panel.border = ggplot2::element_blank()
    )
}
