import duckdb
import pandas as pd

df = pd.read_csv('/Users/kchang312/repos/F1-Race-Result-Analysis/data/clean/drivers.csv')

# my_query = 'SELECT * FROM "df" WHERE nationality = "German"'
# results = duckdb.query(my_query).to_df()
# print(results)

german_drivers_df = df[df['nationality'] == 'German']
print(german_drivers_df)