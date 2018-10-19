

#' Transforms an effect allele frequency (EAF) to a minor allele frequency (MAF).
#'
#' @description EAFs can range between 0 and 1 and is tied to a phenotype ("effect", the frequency of
#' the effect allele in a specific dataset). Compared to that, MAFs represent the frequency
#' of the minor allele, hence it ranges between 0 and 0.5. All EAFs with a value larger than
#' 0.5 are turned into MAFs by subtracting them from 1.
#'
#' @param eaf effect allele frequecy, numeric value between 0 and 1.
#'
#' @return numeric \code{maf} vector, same length as eaf
#' @export
#' @details To turn MAFs into EAFs knowledge about the effect allele is needed.
#'
#'
#' @examples
#' eaf2maf(0.7)
#' eaf2maf(c(0.78, 0.32))
#'
eaf2maf <- function(eaf = NULL) {
  if (any(is.infinite(eaf))) {
    warning("The 'eaf' vector contains infinite values. These will be turned into NAs.")
    is.na(eaf) <- is.infinite(eaf)
  }

  if (is.null(eaf)) {
    stop("No 'eaf' vector provided.")
  }

  if (is.character(eaf)) {
    stop("'eaf' must be a numeric vector.")
  }


  if (all(is.na(eaf))) {
    stop("All values in 'eaf' are NA.")
  }

  if (is.numeric(eaf)) {
    maf <- eaf
    ind <- which(eaf > 0.5)
    maf[ind] <- 1 - eaf[ind]
    return(maf)
  }
}
