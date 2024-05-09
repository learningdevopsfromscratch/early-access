#!/bin/bash
# PROJECT_ID="devopsfromscratch"
# SERVICE_ACCOUNT="learndevopsfromscratch"
# gcloud iam service-accounts add-iam-policy-binding "$SERVICE_ACCOUNT@${PROJECT_ID}.iam.gserviceaccount.com" \
#                                                    --project="${PROJECT_ID}" \
#                                                    --role="roles/iam.serviceAccountTokenCreator" \
#                                                    --member=serviceAccount:$SERVICE_ACCOUNT@${PROJECT_ID}.iam.gserviceaccount.com


GOOGLE_CLOUD_PROJECT_ID="devopsfromscratch"
SERVICE_ACCOUNT_NAME="learndevopsfromscratch@${GOOGLE_CLOUD_PROJECT_ID}.iam.gserviceaccount.com"

gcloud projects add-iam-policy-binding ${GOOGLE_CLOUD_PROJECT_ID} \
    --member="serviceAccount:${SERVICE_ACCOUNT_NAME}" \
    --role="roles/run.developer" || true