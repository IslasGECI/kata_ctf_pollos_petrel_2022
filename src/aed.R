library("tidyverse")

data <- read_csv("pollos_petrel/train.csv")

long_tarso <- data %>% 
  drop_na(Longitud_tarso)