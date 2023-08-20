#!/usr/bin/env bash
echo "** setting environment variables **"
PROJECT_ID=$(gcloud config get-value project)
BUCKET="ml-staging-mlzoomcamp"
REGION="europe-west1"
PIPELINES_HOST=$1

echo "** initiating cloud function **"
echo "** current working directory **"
pwd 
echo "** lis the workspace contents**"
ls
echo "** deploy the cloud function **"
gcloud functions deploy init_pipeline --gen2 --source=./src/pipeline  --runtime=python39 \
     --set-env-vars PROJECT=${PROJECT_ID},BUCKET=${BUCKET}, \
     --trigger-resource="${BUCKET}"  \
     --trigger-event=google.storage.object.finalize \
     --region=${REGION}
     