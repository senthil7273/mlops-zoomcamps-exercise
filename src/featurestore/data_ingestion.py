from google.cloud import aiplatform
import pandas as pd
from google.cloud import storage




def read_from_bucket(bucket_name, file_name):
    # Initialize the GCS client
    client = storage.Client()
    # Get the bucket and blob (object)
    bucket = client.get_bucket(bucket_name)
    blob = bucket.blob(file_name)
    # Download the blob's content (CSV data)
    csv_data = blob.download_as_text()
    return csv_data

def load_data_frame():
    bucket_name = "cancer-data-sink"
    csv_file_name = "cancer-reg.csv"
    data_file = read_from_bucket(bucket_name, csv_file_name)
    df = pd.DataFrame(data_file)
    return df

def read_data():
    df = load_data_frame()
    print(df.head())
    


