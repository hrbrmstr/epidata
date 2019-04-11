#' Poverty-level wages
#'
#' Return the share of workers earning equal to or less than the poverty-level wage, or
#' the hourly wage that a full-time, year-round worker must earn to sustain a family of
#' four with two children at the official poverty threshold.
#'
#' Population sample: Wage and salary workers age 18–64. Data source: CPS ORG | Census
#' Bureau (poverty threshold)
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender) or
#'   \code{r} (Race), i.e. if you want to retrieve
#'   unemployment data by gender and race, you would set this parameter to "\code{gr}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{https://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples \dontrun{
#' get_poverty_level_wages()
#'
#' get_poverty_level_wages("r")
#'
#' get_poverty_level_wages("gr")
#' }
get_poverty_level_wages <- function(by=NULL) {

  params <- list(subject="povwage")

  if (!is.null(by)) {
    params <- make_params(params, by, c("g", "r"))
    # params <- c(params, list(subject="wage", d="10,50,95,5010,9550,mean"))
  }

  res <- epi_query(params)

  cols <- stringi::stri_trans_tolower(res$columns$name)
  cols <- stringi::stri_replace_all_regex(cols, "[\\('%\\+\\)]", "")
  cols <- stringi::stri_replace_all_regex(cols, "[[:space:]" %s+%
                                            rawToChar(as.raw(c(0xe2, 0x80, 0x93))) %s+% "-]+",
                                          "_")
  cols <- stringi::stri_replace_first_regex(cols, "([[:digit:]])", "x_$1")
  cols <- stringi::stri_replace_all_regex(cols, "_+", "_")

  out <- setNames(as_data_frame(res$data), cols)
  out <- dplyr::mutate_all(out, "clean_cols")
  out <- suppressMessages(readr::type_convert(out))

  cite <- html_text(read_html(res$meta$source %||% "<p>Economic Policy Institute</p>"))
  message(sprintf('Note: %s\nCitation: "%s"', res$meta$notes %||% "None", cite))

  out

}
