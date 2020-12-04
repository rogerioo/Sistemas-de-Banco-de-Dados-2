from sqlalchemy import create_engine, exc
import pandas as pd
import re


def insert_into_db(connection_string: str, table_name: str, data: dict):
    db = create_engine(connection_string)

    df = pd.DataFrame(data)

    df.to_sql(table_name, con=db,
              if_exists='append', method=None, index=False)

    db.dispose()


connection_string = 'mysql+mysqldb://rogeriojunior:12345@localhost:3306/us_election_2020'

df = pd.read_csv('hashtag_joebiden.csv')


# Prepare dataset
df = df.drop_duplicates()
df = df.dropna()

df.loc[:, 'lat'] = df.apply(lambda row: float(row['lat']), axis=1)
df.loc[:, 'long'] = df.apply(lambda row: float(row['long']), axis=1)
df.loc[:, 'state'] = df.apply(lambda row: row['state'].capitalize(), axis=1)
df.loc[:, 'user_id'] = df.apply(lambda row: int(float(row['user_id'])), axis=1)

df = df.drop_duplicates(['tweet_id'])


# Set data for each table according db specifications
source_data = list(df['source'].unique())
location_data = df.drop_duplicates(['lat', 'long'])
state_data = df.drop_duplicates(['state_code', 'state'])
user_data = df.drop_duplicates(['user_id'], keep='first')


# Set data according to table schema
state = {
    'state_code': list(state_data['state_code']),
    'state_name': list(state_data['state'])
}

source = {
    'name': source_data
}

user = {
    'user_id': [int(float(item)) for item in list(user_data['user_id'])],
    'name': list(user_data['user_name']),
    'screen_name': list(user_data['user_screen_name']),
    'description': list(user_data['user_description']),
    'followers_count': [int(float(item)) for item in list(user_data['user_followers_count'])],
    'location': list(user_data['user_location'])
}

location = {
    'latitude': list(location_data['lat']),
    'longitude': list(location_data['long']),
    'city': list(location_data['city']),
    'country': list(location_data['country']),
    'continent': list(location_data['continent']),
    'state_name': list(location_data['state']),
    'state_code': list(location_data['state_code']),
}

tweet = {
    'tweet_id': [int(float(item)) for item in list(df['tweet_id'])],
    'created_at': list(df['created_at']),
    'message': list(df['tweet']),
    'likes': [int(float(item)) for item in list(df['likes'])],
    'retweet_count': [int(float(item)) for item in list(df['retweet_count'])],
    'source_id': [source_data.index(item) + 1 for item in df['source']],
    'user_id': [int(float(item)) for item in list(df['user_id'])],
    'latitude': [float(item) for item in list(df['lat'])],
    'longitude': [float(item) for item in list(df['long'])]
}


insert_into_db(connection_string, 'STATE_DIMENSION', state)
insert_into_db(connection_string, 'SOURCE_DIMENSION', source)
insert_into_db(connection_string, 'USER_DIMENSION', user)
insert_into_db(connection_string, 'LOCATION_DIMENSION', location)
insert_into_db(connection_string, 'FACT_TWEET', tweet)
