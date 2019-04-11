#' Compensation, wages, and benefits
#'
#' Return the nonwage payments, referred to as fringe benefits, and wages.
#' Compensation includes employer payments for health insurance, pensions,
#' and payroll taxes (primarily payments toward Social Security and unemployment insurance).
#'
#' Wages are in 2016 dollars. Wage and salary workers (NIPA) | Private-sector workers (ECEC)
#'
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{https://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @note Data source: NIPA | ECEC
#' @export
#' @examples
#' get_compensation_wages_and_benefits()
get_compensation_wages_and_benefits <- function() {

  params <- list(subject="compben")

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
