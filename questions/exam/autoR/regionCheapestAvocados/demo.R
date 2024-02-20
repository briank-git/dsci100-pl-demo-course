library(tidyverse)

avocado <- read_csv("/grade/serverFilesCourse/dataR/avocado_prices.csv")

### REMOVE ELLIPSES ... BELOW AND REPLACE WITH CORRECT CODE
cheapest <- avocado |>
   filter(yr == ...) |>
   group_by(...) |>
   summarize(avg_price = mean(...))  |>
   arrange(...) |> 
   slice(...)