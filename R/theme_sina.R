
#' Theme Sina
#'
#' @param base_size
#' @param base_family
#'
#' @return
#' @export
#'
#' @examples
theme_sina <- function (base_size = 11, base_family = "")
{
  theme_grey(base_size = base_size,
             base_family = base_family) %+replace%
    theme(strip.text.y = element_text(angle = 0), panel.background = element_rect(fill = "white", colour = NA), panel.border = element_rect(fill = NA, colour = "grey20"), panel.grid.major = element_line(colour = "grey92"),
          panel.grid.minor = element_line(colour = "grey92", size = 0.25), strip.background = element_rect(fill = "grey85", colour = "grey20"),
          legend.key = element_rect(fill = "white", colour = NA), complete = TRUE)
}
