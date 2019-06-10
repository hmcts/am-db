#!/bin/bash
set -e

az account set --subscription DCD-CNP-DEV
az acr task show --registry hmcts --name task-create-am-db-image