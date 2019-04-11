#' Annual wages by wage group
#'
#' Return the average annual salaries for select wage groups, with particular focus on
#' the highest wage earners. Note that this data is not directly comparable to wage
#' deciles/percentiles.
#'
#' Wages are in 2017 dollars. Population sample: All workers.
#'
#' The average annual wages by wage group are taken from a 2010 article by Wojciech Kopczuk,
#' Emmanuel Saez, and Jae Song. To extend this series, data for 2006 through 2017 are
#' extrapolated from 2004 data using changes in wage shares computed from Social Security
#' Administration wage statistics. We employ the midpoint of the bracket to compute total
#' wage income in each bracket and sum all brackets. We then use interpolation to derive
#' percentile cutoffs building from the bottom up to obtain the 0–90th percentile bracket
#' and then estimate the remaining categories. This allows us to estimate the wage shares
#' for upper wage groups. We use these wage shares computed for 2004 and later years to
#' extend the Kopczuk, Saez, and Song series by adding the changes in share between 2004
#' and the relevant year to their series. To obtain absolute wage trends we use the SSA data
#' on the total wage pool and employment and compute the real wage per worker (based on t
#' heir share of wages and employment) in the different groups in 2017 dollars. For a
#' detailed explanation, see the methodology for annual wages and hours.
#'
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{https://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @note Data source: SSA | Kopczuk, Saez, and Song (2010)
#' @export
#' @examples
#' get_annual_wages_by_wage_group()
get_annual_wages_by_wage_group <- function() {

  params <- list(subject="wagegroup")

  res <- epi_query(params)

  cols <- stringi::stri_trans_tolower(res$columns$name)
  cols <- stringi::stri_replace_all_regex(cols, "[\\('%\\)]", "")
  cols <- stringi::stri_replace_all_regex(cols, "[[:space:]" %s+%
                                            rawToChar(as.raw(c(0xe2, 0x80, 0x93))) %s+% "-]+",
                                          "_")
  cols <- stringi::stri_replace_first_regex(cols, "([[:digit:]])", "x_$1")

  out <- setNames(as_data_frame(res$data), cols)
  out <- dplyr::mutate_all(out, "clean_cols")
  out <- suppressMessages(readr::type_convert(out))

  cite <- html_text(read_html(res$meta$source %||% "<p>Economic Policy Institute</p>"))
  message(sprintf('Note: %s\nCitation: "%s"', res$meta$notes %||% "None", cite))

  out

}
