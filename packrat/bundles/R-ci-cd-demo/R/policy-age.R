#' Evaluate Age of a customer against current policy rules
#'
#' @param numeric age
#' @return list of violated policy rules
policyAgeEvaluation <- function(age) {
  stopifnot(age >= 0)
  stopifnot(is.integer(age))

  if (age < 18) {
    return(c("AGE-U"))
  }

  if (age > 55) {
    return(c("AGE-O"))
  }

  return(list())
}
