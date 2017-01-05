#' Retreive the share of the labor force without a job
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender),
#'   \code{r} (Race), \code{a} (Age), \code{e} (Education).  i.e. if you want to retrieve
#'   unemployment data by gender, race and education, you would set this parameter to "\code{gre}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @note See \code{get_unemployment_by_state()} for information on retrieving unemployment by state+race.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_unemployment()
#'
#' get_unemployment("r")
#'
#' get_unemployment("grae")
get_unemployment <- function(by=NULL) {

  params <- list(subject="unemp")

  if (!is.null(by)) params <- make_params(params, by, c("g", "r", "a", "e"))

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

#' Retreive the share of the labor force without a job (by state)
#'
#' @param by \code{NULL} or \code{r} for a partition by race.
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @note See \code{get_unemployment()} for other unemployment extracts..
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_unemployment_by_state()
#'
#' get_unemployment_by_state("r")
get_unemployment_by_state <- function(by=NULL) {

  params <- list(subject="unempstate")

  if (!is.null(by)) params <- make_params(params, by, c("r"))

  res <- epi_query(params)

  cols <- stringi::stri_trans_tolower(res$columns$name)
  cols <- stringi::stri_replace_all_regex(cols, "[[:space:]" %s+%
                                            rawToChar(as.raw(c(0xe2, 0x80, 0x93))) %s+% "-]+",
                                          "_")
  out <- setNames(as_data_frame(res$data), cols)
  out <- dplyr::mutate_all(out, "clean_cols")
  out <- suppressMessages(readr::type_convert(out))
  out <- tidyr::gather(out, region, value, -date)

  cite <- html_text(read_html(res$meta$source %||% "<p>Economic Policy Institute</p>"))
  message(sprintf('Note: %s\nCitation: "%s"', res$meta$notes %||% "None", cite))

  out

}

#' Retreive  the share of the labor force that has been unemployed for six months or longer
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender),
#'   \code{r} (Race), \code{a} (Age), \code{e} (Education). i.e. if you want to retrieve
#'   unemployment data by gender, race and education, you would set this parameter to "\code{gre}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_long_term_unemployment()
#'
#' get_long_term_unemployment("r")
#'
#' get_long_term_unemployment("grae")
get_long_term_unemployment <- function(by=NULL) {

  params <- list(subject="ltunemp")

  if (!is.null(by)) params <- make_params(params, by, c("g", "r", "a", "e"))

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

#' Retreive the share of the labor force that is "underemployed"
#'
#' Underemployment is the share of the labor force that either 1) is unemployed, 2) is
#' working part time but wants and is available to work full time (an "involuntary" part
#' timer), or 3) wants and is available to work and has looked for work in the last year
#' but has given up actively seeking work in the last four weeks ("marginally attached"
#' worker).
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender),
#'   \code{r} (Race), \code{a} (Age), \code{e} (Education). i.e. if you want to retrieve
#'   unemployment data by gender, race and education, you would set this parameter to "\code{gre}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_underemployment()
#'
#' get_underemployment("r")
#'
#' get_underemployment("grae")
get_underemployment <- function(by=NULL) {

  params <- list(subject="underemp")

  if (!is.null(by)) params <- make_params(params, by, c("g", "r", "a", "e"))

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

#' Retreive the share of the civilian noninstitutional population that is in the labor force
#'
#' (i.e., working or looking for work)
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender),
#'   \code{r} (Race), \code{a} (Age), \code{e} (Education). i.e. if you want to retrieve
#'   unemployment data by gender, race and education, you would set this parameter to "\code{gre}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @export
#' @examples
#' get_labor_force_participation_rate()
#'
#' get_labor_force_participation_rate("r")
#'
#' get_labor_force_participation_rate("grae")
get_labor_force_participation_rate <- function(by=NULL) {

  params <- list(subject="lfpr")

  if (!is.null(by)) params <- make_params(params, by, c("g", "r", "a", "e"))

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

#' Retreive the share of the civilian noninstitutional population that is employed
#'
#' @param by \code{NULL} or character string with any combination of \code{g} (Gender),
#'   \code{r} (Race), \code{a} (Age), \code{e} (Education). i.e. if you want to retrieve
#'   unemployment data by gender, race and education, you would set this parameter to "\code{gre}".
#' @return \code{tbl_df} with data filtered by the selected criteria.
#' @export
#' @references \href{http://www.epi.org/data/}{Economic Policy Institute Data Library}
#' @examples
#' get_employment_to_population_ratio()
#'
#' get_employment_to_population_ratio("r")
#'
#' get_employment_to_population_ratio("grae")
get_employment_to_population_ratio <- function(by=NULL) {

  params <- list(subject="lfpr")

  if (!is.null(by)) params <- make_params(params, by, c("g", "r", "a", "e"))

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