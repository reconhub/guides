
## This script loads all required packages, and throws error messages for ones
## that are missing.

required_packages <- c(
  "here",
  "incidence",
  "epicontacts",
  "epitrix",
  "projections",
  "magrittr",
  "ggplot2",
  "linelist", # devel, only on github
  "ggthemr", # devel, only on github
  "tidyverse"
)

available_packages <- .packages(all.available = TRUE)

## load packages
for (i in seq_along(required_packages)) {
  pkg <- required_packages[i]
  if (! pkg %in% available_packages) {
    msg <- sprintf("The package '%s' is not installed - trying to install it...",
                   pkg)
    message(msg)
    suppressWarnings(try(utils::install.packages(pkg)))
    if (! pkg %in% available_packages) {
      msg <- sprintf("Package %s could not be installed :-/",
                     msg)
      warning(msg)
    }
  }
  if (require(pkg, character.only = TRUE)) {
    msg <- sprintf("Package '%s' loaded",
                   pkg)
  }
}
