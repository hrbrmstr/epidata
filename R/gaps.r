#' Retreive the percent by which hourly wages of female workers are less than hourly wages of male workers
#'
#' The gender wage gap is the percent by which hourly wages of female workers are less than
#' hourly wages of male workers. It is also often expressed as a wage ratio (women's
#' share of men's wages) by subtracting the gap from 100 percent.
#'
#' \itemize{
#' \item{A median gender wage gap of 17.3 percent means that a typical woman is paid 17.3
#'       percent less per hour than a typical man.}
#' \item{An average gender wage gap of 19.7 percent means that on average women are paid
#'       19.7 percent less per hour than men.}
#' \item{A regression-based gender wage gap of 21.7 percent means that on average women
#'       are paid 21.7 percent less per hour than men, all else held equal (controlling for
#'       gender, race and ethnicity, education, experience, and geographic location).}
#' }
#'
#' @param by \code{NULL} or \code{r} for a parition by race
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_gender_wage_gap()
#'
#' get_gender_wage_gap("r")
get_gender_wage_gap <- function(by=NULL) {

  params <- list(subject="wagegap-mf")

  if (!is.null(by)) params <- make_params(params, by, c("r"))

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

#' Retreive the percent by which hourly wages of black workers are less than hourly wages of white workers
#'
#' The black-white wage gap is the percent by which hourly wages of black workers are less
#' than hourly wages of white workers. It is also often expressed as a wage ratio (black
#' workers' share of white workers' wages) by subtracting the gap from 100 percent.
#'
#' \itemize{
#' \item{A median black-white wage gap of 26.2 percent means that a typical black worker
#'       is paid 26.2 percent less per hour than a typical white worker.}
#' \item{An average black-white wage gap of 26.6 percent means that on average black
#'       workers are paid 26.6 percent less per hour than white workers.}
#' \item{A regression-based black-white wage gap of 15.2 percent means that on average
#'       black workers are paid 15.2 percent less per hour than white workers, all else
#'       held equal (controlling for gender, race and ethnicity, education, experience,
#'       and geographic location).}
#' }
#'
#' @param by \code{NULL} or \code{g} for a parition by gender
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_black_white_wage_gap()
#'
#' get_black_white_wage_gap("g")
get_black_white_wage_gap <- function(by=NULL) {

  params <- list(subject="wagegap-bw")

  if (!is.null(by)) params <- make_params(params, by, c("g"))

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

#' Retreive the percent by which hourly wages of Hispanic workers are less than hourly wages of white workers
#'
#' The Hispanic-white wage gap is the percent by which hourly wages of Hispanic workers
#' are less than hourly wages of white workers. It is also often expressed as a wage ratio
#' (Hispanic workers' share of white workers' wages) by subtracting the gap from 100 percent.
#'
#' \itemize{
#' \item{A median Hispanic-white wage gap of 29.6 percent means that a typical Hispanic
#'       worker is paid 29.6 percent less per hour than a typical white worker.}
#' \item{An average Hispanic-white wage gap of 30.1 percent means that on average Hispanic
#'       workers are paid 30.1 percent less per hour than white workers.}
#' \item{A regression-based Hispanic-white wage gap of 11.1 percent means that on average
#'       Hispanic workers are paid 11.1 percent less per hour than white workers, all
#'       else held equal (controlling for gender, race and ethnicity, education,
#'       experience, and geographic location).}
#' }
#'
#' @param by \code{NULL} or \code{g} for a parition by gender
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_hispanic_white_wage_gap()
#'
#' get_hispanic_white_wage_gap("g")
get_hispanic_white_wage_gap <- function(by=NULL) {

  params <- list(subject="wagegap-hw")

  if (!is.null(by)) params <- make_params(params, by, c("g"))

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

#' Retreive the percent by which hourly wages of college graduates exceed those of otherwise
#' equivalent high school graduates
#'
#' A regression-based college wage premium of 56.1 percent means that on average workers
#' with a college degree are paid 56.1 percent more per hour than workers whose highest
#' education credential is a high school diploma, all else held equal (controlling for
#' gender, race and ethnicity, education, experience, and geographic location).
#'
#' @param by \code{NULL} or \code{g} for a parition by gender
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_college_wage_premium()
#'
#' get_college_wage_premium("g")
get_college_wage_premium <- function(by=NULL) {

  params <- list(subject="wagegap-coll")

  if (!is.null(by)) params <- make_params(params, by, c("g"))

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

#' Retreive the percent by which hourly wages of workers without a high school diploma
#' (or equivalent) are less than wages of otherwise equivalent workers who have graduated
#' from high school
#'
#' A regression-based non-high school wage penalty of 21.8 percent means that on average
#' workers without a high school diploma are paid 21.8 percent less per hour than workers
#' with a high school diploma, all else held equal (controlling for gender, race and
#' ethnicity, education, experience, and geographic location).
#'
#' @param by \code{NULL} or \code{g} for a parition by gender
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples \dontrun{
#' get_non_high_school_wage_penalty()
#'
#' get_non_high_school_wage_penalty("g")
#' }
get_non_high_school_wage_penalty <- function(by=NULL) {

  params <- list(subject="wagegap-hs")

  if (!is.null(by)) params <- make_params(params, by, c("g"))

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

#' Retreive the level of inequality within the hourly wage distribution.
#'
#' The 95–50 and 50–10 wage ratios are representations of the level of inequality within
#' the hourly wage distribution. The larger the ratio, the greater the gap between the
#' top and the middle or the middle and the bottom of the wage distribution.
#'
#' \itemize{
#' \item{A 50–10 wage ratio of 1.91 means that workers at the 50th percentile of the wage
#'       distribution are paid 1.91 times more per hour than the workers at the 10th percentile.}
#' \item{A 95–50 wage ratio of 3.28 means that workers at the 95th percentile of the wage
#'       distribution are paid 3.28 times more per hour than the workers at the 50th percentile.}
#' }
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender) or
#'   \code{r} (Race), i.e. if you want to retrieve
#'   unemployment data by gender and race, you would set this parameter to "\code{gr}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples \dontrun{
#' get_wage_ratios()
#'
#' get_wage_ratios("r")
#'
#' get_wage_ratios("gr")
#' }
get_wage_ratios <- function(by=NULL) {

  params <- list(preset="wage-ratios")

  if (!is.null(by)) {
    params <- make_params(params, by, c("g", "r"))
    params <- c(params, list(subject="wage", d="10,50,95,5010,9550,mean"))
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
