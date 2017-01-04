# Do the hard work of formatting the parameters and issuing the query
epi_query <- function(args) {

  qs <- paste(sprintf("%s=%s", names(args), args), collapse="&")

  httr::POST(
    "http://www.epi.org/wp-admin/admin-ajax.php",
    httr::add_headers(`X-Requested-With`="XMLHttpRequest"),
    encode="form",
    body=list(action="epi_getdata", queryString = qs)) -> res

  httr::stop_for_status(res)

  jsonlite::fromJSON(httr::content(res, as="text"), flatten=TRUE)

}
