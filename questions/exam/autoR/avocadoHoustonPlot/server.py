import prairielearn as pl
import pandas as pd

def generate(data):
    df = pd.read_csv(data["options"]["server_files_course_path"] + "/dataR/avocado_prices.csv", header=None)
    data["params"]["df"] = pl.to_json(df.head(5))