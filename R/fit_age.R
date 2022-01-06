return_one <- function() {
  return(1)
}

split_id <- function (long_tarso) {
  id_train <- sample(nrow(long_tarso), floor(nrow(long_tarso) * .8))
  return(id_train)
}

return_mean_train_data <- function() {
  expected <- tibble(id=1:3, target = 35.99)
  return(expected)
}