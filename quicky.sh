#!/bin/bash
PROJECT_ID="devopsfromscratch"
SERVICE_ACCOUNT="learndevopsfromscratch"
gcloud iam service-accounts add-iam-policy-binding "$SERVICE_ACCOUNT@${PROJECT_ID}.iam.gserviceaccount.com" \
                                                   --project="${PROJECT_ID}" \
                                                   --role="roles/iam.serviceAccountTokenCreator" \
                                                   --member=serviceAccount:$SERVICE_ACCOUNT@${PROJECT_ID}.iam.gserviceaccount.com