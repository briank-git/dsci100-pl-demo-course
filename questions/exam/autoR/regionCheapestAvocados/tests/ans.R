library(tidyverse)

avocado <- read_csv("/grade/serverFilesCourse/avocado_prices.csv")

cheapest <- avocado |>
    filter(yr == 2018) |> 
    group_by(region) |>
    summarize(avg_price = mean(average_price)) |>
    arrange(avg_price) |> 
    slice(1)