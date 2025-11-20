#!/bin/bash

# note - some objects are dependent on others. script may need to be run multiple times

INIT_PROJECTS=true
INSTALL_ACM=false
INSTALL_GITOPS=true
INSTALL_LOGGING=false
INSTALL_PIPELINES=true
INSTALL_SAMPLE=true
INSTALL_QUAY=true

if [ "$INIT_PROJECTS" = true ]; then
	echo "setting up projects"
	oc apply -f projects
fi

# note - enable plugin after installing
if [ "$INSTALL_ACM" = true ]; then
	echo "installing ACM"
	oc apply -f acm
fi

if [ "$INSTALL_GITOPS" = true ]; then
	echo "installing gitops (argocd)"
	oc apply -f gitops
fi

# note - enable plugin after installing
if [ "$INSTALL_LOGGING" = true ]; then
	echo "installing logging"
	oc apply -f logging
fi

# note - enable plugin after installing
if [ "$INSTALL_PIPELINES" = true ]; then
	echo "installing pipelines (tekton)"
	oc apply -f pipelines
fi

# note - requires quay & pipelines
if [ "$INSTALL_SAMPLE" = true ]; then
	echo "adding demo python project"
	oc apply -f python-sample/manifests
fi

if [ "$INSTALL_QUAY" = true ]; then
	echo "installing quay (image registry)"
	oc apply -f quay
fi
