import pandas as pd 
import matplotlib.pyplot as plt

data = pd.read_csv('/Users/Kat/Documents/repos/F1-Race-Result-Analysis/data/raw/results.csv')
df = pd.DataFrame(data)

# df.plot(kind='scatter',x='position', y='time')
# plt.show()

print(df.head())