#' Retreive Productivity and hourly compensation
#'
#' Productivity is how much workers produce per hour, or the growth of output of goods and
#' services minus depreciation per hour worked. Compensation is made up of both nonwage
#' payments and wages.
#'
#' Wages are in 2015 dollars. Median compensation is calculated using hourly wage medians
#' from the CPS ORG and compensation from NIPA.
#'
#' Population sample: All workers & Production and nonsupervisory workers
#'
#' @param by \code{NULL} or character string of \code{g} (Gender)
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @note Data source: NIPA (compensation) | BLS Productivity Data
#' @export
#' @examples
#' get_productivity_and_hourly_compensation()
#'
#' get_productivity_and_hourly_compensation("g")
get_productivity_and_hourly_compensation <- function(by=NULL) {

  params <- list(subject="prodpay")

  if (!is.null(by)) {
    params <- make_params(params, by, "g")
  }

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
