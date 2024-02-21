import pandas as pd

avocado = pd.read_csv("/grade/serverFilesCourse/dataR/avocado_prices.csv")

### REMOVE UNDERLINES ___ BELOW AND REPLACE WITH CORRECT CODE
cheapest = (
    (
        avocado[avocado["yr"] == ___]
        .groupby(___)
        .mean(numeric_only=True)
        .reset_index()
        .sort_values(by=___)
    )
    .head(___)
    [[___, ___]]
)  