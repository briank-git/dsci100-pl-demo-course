library(tidyverse)

avocado <- read_csv("/grade/serverFilesCourse/dataR/avocado_prices.csv")

avocado_plot <- avocado |>
    mutate(total_volume = small_hass_volume + large_hass_volume + extra_l_hass_volume) |>
    filter(region == "Houston") |>
    ggplot(aes(x = total_volume, y = average_price)) + 
        geom_point() + 
        xlab("Total avocado volume sold \nin Houston (lbs)") +
        ylab("Average avocado price \nin Houston (USD)") +
        scale_x_log10() +
        theme(text = element_text(size = 20))