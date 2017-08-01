#' Retreive Pension Coverage
#'
#' Employer-provided pension coverage shows the share of workers included in an
#' employer-provided plan for which the employer paid for at least some of their pension
#' coverage.
#'
#' Population sample: Private-sector workers age 18–64 & at least 20 hours/week and 26 weeks/year
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender),
#'   \code{r} (Race), \code{e} (Education), \code{d} (Percentile), \code{l} (Entry-level)
#'   i.e. if you want to retrieve pension data by gender and race, you would set this
#'   parameter to "\code{gr}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @note Data source: CPS ASEC
#' @export
#' @examples
#' get_health_insurance_coverage()
#'
#' get_health_insurance_coverage("r")
#'
#' get_health_insurance_coverage("gr")
get_pension_coverage <- function(by=NULL) {

  params <- list(subject="pensioncov")

  if (!is.null(by)) {
    params <- make_params(params, by, c("g", "r", "e", "d", "l"))
  }
  names(params) <- gsub("^l$", "el", names(params))

  res <- epi_query(params)

  cols <- stringi::stri_trans_tolower(res$columns$name)
  cols <- stringi::stri_replace_all_regex(cols, "[[:space:]" %s+%
                                            rawToChar(as.raw(c(0xe2, 0x80, 0x93))) %s+% "-]+",
                                          "_")
  out <- setNames(as_data_frame(res$data), cols)
  out <- dplyr::mutate_all(out, "clean_cols")
  out <- suppressMessages(readr::type_convert(out))

  cite <- html_text(read_html(res$meta$source %||% "<p>Economic Policy Institute</p>"))
  message(sprintf('Note: %s\nCitation: "%s"', res$meta$notes %||% "None", cite))

  out

}