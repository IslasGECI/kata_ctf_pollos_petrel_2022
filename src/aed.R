library("tidyverse")

data <- read_csv("pollos_petrel/train.csv")

long_tarso <- data %>%
  drop_na(Longitud_tarso)


id_train <- split_id(long_tarso)
data_train <- long_tarso[id_train, ]
data_test <- long_tarso[-id_train, ]
