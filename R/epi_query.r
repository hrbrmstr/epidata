# Do the hard work of formatting the parameters and issuing the query
epi_query <- function(args) {

  qs <- paste(sprintf("%s=%s", names(args), args), collapse="&")

  httr::POST(
    "https://www.epi.org/wordpress/wp-admin/admin-ajax.php",
    httr::add_headers(
      `X-Requested-With` = "XMLHttpRequest",
      `Referer` = "https://www.epi.org/data/"
    ),
    .EPIDATA_UA,
    encode = "form",
    body = list(
      action = "epi_getdata",
      queryString = qs
    )
  ) -> res

  if (httr::status_code(res) != 200) {
    warning("EPI API is unresponsive. Please try again later.", call. = FALSE)
    return(NULL)
  }

  jsonlite::fromJSON(httr::content(res, as="text"), flatten=TRUE)

}
