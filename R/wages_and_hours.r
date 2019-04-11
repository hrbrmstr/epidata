#' Retreive CPS ASEC Annual Wages and Work Hours
#'
#' Annual, weekly, and hourly wages and work hours show the average wages and work hours
#' of wage and salary workers using data from the CPS ASEC (also known as the March CPS).
#' Note that this data is not directly comparable to the CPS ORG data in median/average
#' hourly wage.
#'
#' @return \code{tbl_df}
#' @references \href{https://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @note CPS ASEC | Murphy and Welch (1989)
#' @export
#' @examples
#' get_annual_wages_and_work_hours()
get_annual_wages_and_work_hours <- function() {

  params <- list(subject="hours")

  res <- epi_query(params)

  cols <- stringi::stri_trans_tolower(res$columns$name)
  cols <- stringi::stri_replace_all_regex(cols, "[\\('\\)]", "")
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
