return_one <- function() {
  return(1)
}

split_id <- function (long_tarso) {
  id_train <- sample(nrow(long_tarso), floor(nrow(long_tarso) * .8))
  return(id_train)
}

return_mean_train_data <- function(data) {
  expected <- data %>% 
    mutate(target = 35.99) %>%
    select(c(id, target))
  return(expected)
}

return_lineal_train_data <- function(data) {
  ajuste <- 23.92 
  expected <- data %>% 
    mutate(target = Masa - ajuste) %>%
    select(c(id, target))
  return(expected)
}
