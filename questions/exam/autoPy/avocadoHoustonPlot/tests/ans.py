import altair as alt
import pandas as pd

avocado = pd.read_csv("/grade/serverFilesCourse/dataR/avocado_prices.csv")

avocado = avocado.assign(
    total_volume=avocado["small_hass_volume"]
        + avocado["large_hass_volume"]
        + avocado["extra_l_hass_volume"]
)

avocado_plot = alt.Chart(avocado[avocado["region"] == "Houston"]).mark_point().encode(
    x=alt.X("total_volume")
        .title("Total avocado volume sold in Houston (lbs)")
        .scale(type="log"),
    y=alt.Y("average_price").title("Average avocado price in Houston (USD)"),
)