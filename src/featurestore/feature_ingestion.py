from google.cloud import aiplatform
from google.cloud.aipltform import Feature, FeatureStore
import pandas as pd
from google.cloud import storage
from config import feature_config


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


def batch_create_features(
    project: str,
    location: str,
    entity_type_id: str,
    featurestore_id: str,
    sync: bool = True,
):
    aiplatform.init(project=project, location=location)

    entity_type = aiplatform.featurestore.EntityType(
        entity_type_name=entity_type_id, featurestore_id=featurestore_id
    )
    entity_type.batch_create_features(feature_configs=feature_config.config, sync=sync)


def ingest_data():
    batch_create_features()
    # load_data_frame()
