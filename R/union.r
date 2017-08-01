#' Retreive Union Coverage
#'
#' The union coverage rate shows the percentage of the workforce covered by a collective
#' bargaining agreement.
#'
#' @return \code{tbl_df}
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @note Data source: CPS ORG | Hirsch and Macpherson (2003)
#' @export
#' @examples
#' get_union_coverage()
get_union_coverage <- function() {

  params <- list(subject="unioncov")

  res <- epi_query(params)

  cols <- stringi::stri_trans_tolower(res$columns$name)
  cols <- stringi::stri_replace_all_regex(cols, "[\\(\\)]", "")
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
