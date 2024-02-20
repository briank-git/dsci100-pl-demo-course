library(tidyverse)

avocado <- read_csv("/grade/serverFilesCourse/dataR/avocado_prices.csv")

# cheapest <- avocado |>
#    filter(yr == ...) |>
#    group_by(...) |>
#    summarize(avg_price = mean(...))  |>
#    arrange(...) |> 
#    slice(...)