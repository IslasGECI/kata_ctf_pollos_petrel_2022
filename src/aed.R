library("tidyverse")

data <- read_csv("pollos_petrel/train.csv")

long_tarso <- data %>% 
  drop_na(Longitud_tarso)

long_tarso %>% sample_frac(size = 0.8, replace = FALSE)


id_train <- sample(nrow(long_tarso), floor(nrow(long_tarso)*.8))
data_test <- subset(long_tarso, id %in% id_train)