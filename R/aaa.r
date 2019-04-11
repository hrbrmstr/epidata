globalVariables(c("date", "region", "value"))


httr::user_agent(
  sprintf(
    "epidata package v%s: (<%s>)",
    utils::packageVersion("epidata"),
    utils::packageDescription("epidata")$URL
  )
) -> .EPIDATA_UA
