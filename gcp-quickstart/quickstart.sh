#!/bin/bash

########################################################################
#                               
#                           READ ME!
#
# Before running the steps, you must have a Google Cloud account
# Register for Google Cloud, then install the Google Cloud SDK
# here: https://cloud.google.com/sdk/docs/install
#
# Be sure to choose your specific operating system
########################################################################


########################################################################
#         
# Configurations
#
########################################################################

# Set your Google Cloud Project ID here
GOOGLE_CLOUD_PROJECT_ID="devopsfromscratch"
# Set your GitHub Repository URL here (ex: https://github.com/learningdevopsfromscratch/early-access)
GITHUB_REPOSITORY_URL="https://github.com/learningdevopsfromscratch/early-access"

########################################################################
#         
# DO NOT CHANGE THESE BELOW - These are default configurations
#
########################################################################
SERVICE_ACCOUNT_NAME="learndevopsfromscratch@${GOOGLE_CLOUD_PROJECT_ID}.iam.gserviceaccount.com"
WORKLOAD_IDENTITY_POOL="github-actions"
GOOGLE_CLOUD_PROJECT_NUMBER=$(gcloud projects describe devopsfromscratch --format="value(projectNumber)")
GITHUB_REPOSITORY_PATH=$(basename $(dirname ${GITHUB_REPOSITORY_URL})/$(basename ${GITHUB_REPOSITORY_URL}))

# ########################################################################
#
# Create a Google Cloud Service account.
#
# Service accounts can be thought of as another form of identification
# for your Google Cloud services. The difference is we can set
# restrictive permissions to each service account so they only have
# enough permissions for their particular job we assign them.
#
# ########################################################################
gcloud iam service-accounts create learndevopsfromscratch \
    --description="Deploy artifacts to Cloud Run" \
    --display-name="learndevopsfromscratch" || true

# ########################################################################
#
# Add the Cloud Run permission to Google Cloud Service account.
#
# We're granting the service account access to deploy and run
# our applications on Google Cloud run.
#
# ########################################################################
gcloud projects add-iam-policy-binding ${GOOGLE_CLOUD_PROJECT_ID} \
    --member="serviceAccount:${SERVICE_ACCOUNT_NAME}" \
    --role="roles/run.invoker" || true


# ########################################################################
#
# Creates a workload identity pool
#
# The workload identity pool can be thought of as a way to connect
# external services like GitHub actions to your Google Cloud services.
# The service account we created earlier will be the service account
# external services will utilize once they're connected through the
# workload identity.
#
# Read more: https://cloud.google.com/iam/docs/workload-identity-federation
# 
# ########################################################################
gcloud iam workload-identity-pools create "${WORKLOAD_IDENTITY_POOL}" \
  --project="${GOOGLE_CLOUD_PROJECT_ID}" \
  --location="global" \
  --display-name="${WORKLOAD_IDENTITY_POOL}" || true


gcloud iam workload-identity-pools providers create-oidc "${WORKLOAD_IDENTITY_POOL}-provider" \
    --project="${GOOGLE_CLOUD_PROJECT_ID}" \
    --location="global" \
    --workload-identity-pool="${WORKLOAD_IDENTITY_POOL}" \
    --display-name="${WORKLOAD_IDENTITY_POOL}-provider" \
    --issuer-uri="https://token.actions.githubusercontent.com" \
    --attribute-mapping="google.subject=assertion.sub,attribute.repository=assertion.repository" || true


gcloud iam service-accounts add-iam-policy-binding "${SERVICE_ACCOUNT_NAME}" \
    --project="${GOOGLE_CLOUD_PROJECT_ID}" \
    --role="roles/iam.workloadIdentityUser" \
    --member="principalSet://iam.googleapis.com/projects/${GOOGLE_CLOUD_PROJECT_NUMBER}/locations/global/workloadIdentityPools/${WORKLOAD_IDENTITY_POOL}/attribute.repository/{GITHUB_REPOSITORY_PATH}" || true

# This final steps enables the workload identity
gcloud services enable iamcredentials.googleapis.com