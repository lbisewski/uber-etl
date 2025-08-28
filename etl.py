from sqlalchemy import create_engine
import pandas as pd
import traceback

# Carregar e tratar os dados
df = pd.read_csv('data/Uber_Dataset.csv')
df['DateTime'] = pd.to_datetime(df['Date'] + ' ' + df['Time'])
df.drop(columns=['Date', 'Time'], inplace=True)
df.sort_values(by='DateTime', inplace=True)
df.columns = df.columns.str.replace(' ', '_')
df = df.drop_duplicates(subset='Booking_ID')
df['Booking_ID'] = df['Booking_ID'].str.strip('"')
df['Customer_ID'] = df['Customer_ID'].str.strip('"')

boolean_cols = ["Cancelled_Rides_by_Customer",
                "Cancelled_Rides_by_Driver",
                "Incomplete_Rides"
                ]

df[boolean_cols] = df[boolean_cols].fillna(0).astype(bool)


# Conectar ao MySQL e carregar os dados
engine = create_engine(
    "mysql+pymysql://usuario:senha@host:porta/mydb")

df.to_sql(
    name="uberRides",
    con=engine,
    if_exists="append",
    index=False
)

print("Upload concluido")
