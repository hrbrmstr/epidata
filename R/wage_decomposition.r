#' Retreive Wage Decomposition
#'
#' Wage inequality data shows the overall wage inequality and the within-group and
#' between-group wage inequality over time. These measures allow an examination of how
#' much of the change in overall wage inequality in particular periods was due to changes
#' in within-group and between-group wage inequality.
#'
#' Population sample: Wage and salary workers age 18–64
#'
#' @param by \code{NULL} or character string of \code{g} (Gender)
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{https://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @note Data source: CPS ORG
#' @export
#' @examples
#' get_wages_by_percentile()
#'
#' get_wages_by_percentile("g")
get_wage_decomposition <- function(by=NULL) {

  params <- list(subject="wageineq")

  if (!is.null(by)) {
    params <- make_params(params, by, "g")
  }

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
