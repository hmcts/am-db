#!/bin/bash
set -e

az account set --subscription DCD-CNP-DEV
az acr task create \
    --registry hmcts \
    --name task-create-am-db-image \
    --file acr-build-task.yaml \
    --context https://github.com/hmcts/am-db.git \
    --branch master \
    --git-access-token $GITHUB_TOKEN