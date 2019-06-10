#!/bin/bash
set -e

az account set --subscription DCD-CNP-DEV
az acr task list-runs --registry hmcts --name task-create-am-db-image | jq '.[0] | {started: .startTime, registry: .outputImages[0].registry, repository: .outputImages[0].repository, tag: .outputImages[0].tag, status: .status}'