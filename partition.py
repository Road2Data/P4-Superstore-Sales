import pandas as pd

# Read in Excel Workbook as dictionary of DataFrames
xl_file = pd.read_excel(io="data/superstore.xlsx", sheet_name=None)

# Iterate through DataFrames, writing each sheet to a CSV file for .
for sheet_name, df in xl_file.items():
    df.columns = [c.replace(" ", "_").replace("-", "") for c in df.columns.tolist()]
    df.to_csv("data/{}".format(sheet_name), index=False)