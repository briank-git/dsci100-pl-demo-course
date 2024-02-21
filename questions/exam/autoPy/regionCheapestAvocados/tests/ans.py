import pandas as pd

avocado = pd.read_csv("/grade/serverFilesCourse/dataR/avocado_prices.csv")

cheapest = (
    (
        avocado[avocado["yr"] == 2018]
        .groupby("region")
        .mean(numeric_only=True)
        .reset_index()
        .sort_values(by="average_price")
    )
    .head(1)
    [["region", "average_price"]]
)