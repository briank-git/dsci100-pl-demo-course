library(tidyverse)

avocado <- read_csv("/grade/serverFilesCourse/dataR/avocado_prices.csv")

### REMOVE ELLIPSES ... BELOW AND REPLACE WITH CORRECT CODE
avocado_plot <- avocado |>
    mutate(total_volume = ... + ... + ...) |>
    filter(...) |>
    ...(aes(x = total_volume, y = average_price)) + 
        geom_point() + 
        xlab("Total avocado volume sold \nin Houston (lbs)") +
        ylab("Average avocado price \nin Houston (USD)") +
        scale_x_log10() +
        theme(text = element_text(size = 20))