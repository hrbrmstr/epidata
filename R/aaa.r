globalVariables(c("date", "region", "value"))

as_data_frame <- function(x) {
  dplyr::as_tibble(as.data.frame(x))
}

httr::user_agent(
  sprintf(
    "epidata package v%s: (<%s>)",
    utils::packageVersion("epidata"),
    utils::packageDescription("epidata")$URL
  )
) -> .EPIDATA_UA


#' Not DoS'ing EPI/Cloudflare
#'
#' @return logical
#' @export
not_dos <- function() {
  utils::getFromNamespace("interactive", "base")()
}