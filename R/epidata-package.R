#' A package to Tools to Retrieve Economic Policy Institute Data Library Extracts
#'
#' The Economic Policy Institute provides researchers, media, and the public with easily
#' accessible, up-to-date, and comprehensive historical data on the American labor force.
#' It is compiled from Economic Policy Institute analysis of government data sources. Use
#' it to research wages, inequality, and other economic indicators over time  and among
#' demographic groups. Data is usually updated monthly.
#'
#' @name epidata
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @importFrom purrr map map_df map_chr keep discard %||%
#' @importFrom stringi stri_replace_all_regex stri_trans_tolower %s+% stri_replace_all_fixed
#' @importFrom dplyr %>% as_data_frame mutate_all
#' @import httr
#' @importFrom readr type_convert
#' @importFrom jsonlite fromJSON
#' @importFrom rvest html_text
#' @importFrom xml2 read_html
#' @importFrom tidyr gather
#' @importFrom stats setNames
NULL
