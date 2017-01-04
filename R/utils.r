make_params <- function(params, by, ok="") {

  by <- stringi::stri_trans_tolower(by)
  by <- stringi::stri_replace_all_regex(by, "[[:space:]]", "")
  by <- strsplit(by, "")[[1]]
  by <- purrr::keep(by, `%in%`, ok)
  by <- sort(unique(by))

  params <- c(params, setNames(as.list(rep("*", length(by))), by))

}

clean_cols <- function(x) {

  if (any(grepl("%", x))) {
    as.numeric(stringi::stri_replace_all_fixed(x, "%", ""))/100
  } else if (any(grepl("\\$", x))) {
    as.numeric(stringi::stri_replace_all_fixed(x, "$", ""))
  } else {
    x
  }

}
