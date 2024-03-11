#!/bin/bash

# required to set

# name of cluster to destroy
export TF_VAR_cluster_name=""


cd terraform
# requires manual approval before actual execution
terraform destroy
