#!/bin/bash

# required to set

# ocm token
export TF_VAR_ocm_token=""

# name of cluster to provision
export TF_VAR_cluster_name=""


# recommended to set

# AWS region - defaults to us-east-1
export TF_VAR_aws_region=""

# OCP version - defaults to 4.15.0 & 4.15
# take off z version for version_short e.g. 
# TF_VAR_rosa_openshift-version=4.15.0 & TF_VAR_rosa_openshift_version_short=4.15
export TF_VAR_rosa_openshift_version=""
export TF_VAR_rosa_openshift_version_short=""


# optional settings
# worker nodes - defaults to 2
export TF_VAR_worker_node_replicas=""

cd terraform
terraform init
terraform plan

# requires manual approval before actual execution
terraform apply
