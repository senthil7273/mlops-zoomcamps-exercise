#!/usr/bin/env bash
echo "** setting environment variables **"
PROJECT_ID=$(gcloud config get-value project)
BUCKET="ml-staging-mlzoomcamp"
REGION="europe-west1"
PIPELINES_HOST=$1

echo "** initiating cloud function **"
gcloud functions deploy init_pipeline --runtime python39 \
     --set-env-vars PROJECT=${PROJECT_ID},BUCKET=${BUCKET}, \
     --trigger-resource="${BUCKET}"  \
     --trigger-event=google.storage.object.finalize