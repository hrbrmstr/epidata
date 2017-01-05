#' Retreive the hourly wage in the middle of the wage distribution
#'
#' The median wage is the hourly wage in the middle of the wage distribution;
#' 50 percent of wage earners earn less and 50 percent earn more. The average wage is
#' the arithmetic mean of hourly wages; or, the sum of all workers' hourly wages divided
#' by the number of workers.
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender) or
#'   \code{r} (Race), i.e. if you want to retrieve
#'   unemployment data by gender and race, you would set this parameter to "\code{gr}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_median_and_mean_wages()
#'
#' get_median_and_mean_wages("r")
#'
#' get_median_and_mean_wages("gr")
get_median_and_mean_wages <- function(by=NULL) {

  params <- list(preset="wage-avg")

  if (!is.null(by)) {
    params <- make_params(params, by, c("g", "r"))
    params <- c(params, list(subject="wage", d="50,mean"))
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

#' Retreive the average hourly wages of workers disaggregated by the highest level of education attained
#'
#' Wages by education are the average hourly wages of workers disaggregated by the highest
#' level of education attained. Employment shares provide the distribution of educational
#' attainment for workers of each gender, racial, and ethnic group as a share of total
#' employed for each group.
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender) or
#'   \code{r} (Race), i.e. if you want to retrieve
#'   unemployment data by gender and race, you would set this parameter to "\code{gr}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_wages_by_education()
#'
#' get_wages_by_education("r")
#'
#' get_wages_by_education("gr")
get_wages_by_education <- function(by=NULL) {

  params <- list(preset="wage-education")

  if (!is.null(by)) {
    params <- make_params(params, by, c("g", "r"))
    params <- c(params, list(subject="wage", e="*", d="50,mean", m="share"))
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

#' Retreive wages at ten distinct points in the wage distribution
#'
#' Wage percentiles are wages at ten distinct points in the wage distribution: deciles
#' and the 95th percentile. The 95–50 and 50–10 wage ratios show how much greater wages
#' are at the top than the middle, and at the middle than the bottom, respectively.
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender) or
#'   \code{r} (Race), i.e. if you want to retrieve
#'   unemployment data by gender and race, you would set this parameter to "\code{gr}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_wages_by_percentile()
#'
#' get_wages_by_percentile("r")
#'
#' get_wages_by_percentile("gr")
get_wages_by_percentile <- function(by=NULL) {

  params <- list(preset="wage-percentiles")

  if (!is.null(by)) {
    params <- make_params(params, by, c("g", "r"))
    params <- c(params, list(subject="wage", d="*"))
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
