return_one <- function() {
  return(1)
}

split_id <- function (long_tarso) {
  id_train <- sample(nrow(long_tarso), floor(nrow(long_tarso) * .8))
  return(id_train)
}