
from custom import import_data
from custom import test_model
from custom import train_model
from custom import evaluate_model
from kfp.v2 import compiler
from google.cloud.aiplatform import pipeline_jobs
import google.cloud.aiplatform as aip
import json
import os

@dsl.pipeline(
    name='ml-pipeline', 
    description='ml-pipeline for cancer regression'
)

def pipeline():
    
    import_data_from_gcs = import_data.import_data_from_gcs()
    train = train_model.train()
    evaluate = evaluate_model.evaluate()
    test = test_model.test()

    train.after(import_data_from_gcs)
    evaluate.after(train)
    test.after(evaluate)

def init_pipeline():

    PIPELINES_HOST = os.environ.get('PIPELINES_HOST', "Environment variable PIPELINES_HOST not set")
    PROJECT_ID = os.environ.get('PROJECT_ID', " PROJECT not set")
    ML_BUCKET = os.environ.get('ML_BUCKET', " BUCKET not set")
    LOCATION = os.environ.get('LOCATION', " BUCKET not set")
    aip.init(
        project=PROJECT_ID,
        location=LOCATION
    )
    compiler.Compiler().compile(
        pipeline_func=pipeline, package_path="pipeline.json"
    )
    job = pipeline_jobs.PipelineJob(
    display_name='cancer-pipeline',
    template_path="pipeline.json",
    pipeline_root = f"gs://{LOCATION}",
    location=REGION,
    enable_caching=True)

    job.run()