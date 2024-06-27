# This script takes a csv file that is generated from the data selected using the longToWide.sql script and inserts rows for the headers, recordedBy, and date fields. This way the data ranges can efficiently turned into tables, which can then be opened as forms, once saved as .xlsx

import pandas as pd

# Load the CSV file into a DataFrame
df = pd.read_csv('_pepe_triState_data.csv')

# Rename the column if necessary
df = df.rename(columns={'transect_number': 'transectId'})

# Get unique transect IDs
transect_ids = df['transectId'].unique()

# Create a new DataFrame to store the final result
result_df = pd.DataFrame(columns=df.columns)

# Iterate through each transect ID
for transect_id in transect_ids:
    # Get all rows for the current transect ID
    transect_rows = df[df['transectId'] == transect_id]
    
    # Append the header row
    header_row = {col: col for col in df.columns}
    result_df = result_df.append(header_row, ignore_index=True)
    
    # Append the transect rows to the result DataFrame
    result_df = pd.concat([result_df, transect_rows], ignore_index=True)
    
    # Append two new rows with specific values in the first column
    recorded_by_row = {col: '' for col in df.columns}
    recorded_by_row['transectId'] = 'Recorded By'
    
    date_row = {col: '' for col in df.columns}
    date_row['transectId'] = 'Date'
    
    result_df = result_df.append(recorded_by_row, ignore_index=True)
    result_df = result_df.append(date_row, ignore_index=True)

# Save the new DataFrame to a new CSV file
result_df.to_csv('output.csv', index=False)
