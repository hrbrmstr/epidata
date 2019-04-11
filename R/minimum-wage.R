#' Minimum wage
#'
#' Return tthe hourly minimum wage set by federal law. The real minimum wage is the federal
#' hourly minimum wage adjusted for inflation.
#'
#' Wages are in 2016 dollars, excluding the nominal federal minimum wage. Share of average
#' wages based on the average wages of production and nonsupervisory workers. For state
#' minimum wages, see EPI’s minimum wage tracker.
#'
#' Population sample: Production and nonsupervisory workers (average wages)
#'
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{https://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @note Data source: U.S. Department of Labor Wage and Hour Division | CES
#' @export
#' @examples
#' get_minimum_wage()
get_minimum_wage <- function() {

  params <- list(subject="minwage")

  res <- epi_query(params)

  cols <- stringi::stri_trans_tolower(res$columns$name)
  cols <- stringi::stri_replace_all_regex(cols, "[\\('%,\\)]", "")
  cols <- stringi::stri_replace_all_fixed(cols, "&", "_and_")
  cols <- stringi::stri_replace_all_fixed(cols, "/", "_")
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
