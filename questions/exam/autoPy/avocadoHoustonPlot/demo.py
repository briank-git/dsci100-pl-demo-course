import altair as alt
import pandas as pd

avocado = pd.read_csv("/grade/serverFilesCourse/dataR/avocado_prices.csv")

### REMOVE UNDERLINES ___ BELOW AND REPLACE WITH CORRECT CODE
avocado = avocado.assign(
    total_volume=avocado[___]
        + avocado[___]
        + avocado[___]
)

avocado_plot = alt.Chart(avocado[avocado[___] == ___]).mark_point().encode(
    x=alt.X(___)
        .title("Total avocado volume sold in Houston (lbs)")
        .scale(type="log"),
    y=alt.Y(___).title("Average avocado price in Houston (USD)"),
)