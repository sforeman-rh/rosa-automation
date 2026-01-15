#!/bin/bash

exists()
{
	command -v "$1" > /dev/null 2>&1
}

for i in rosa git oc terraform ocm aws
do
	if ! exists $i; then
		if [ "$i" = "terraform" ]; then
		    echo "WARNING: Install $i from: https://developer.hashicorp.com/terraform/install"
		elif [ "$i" = "git" ]; then
		    echo "WARNING: Install $i via your platforms package manager or from: https://git-scm.com/downloads/guis/"
		elif [ "$i" = "aws" ]; then
		    echo "WARNING: Install $i via your platforms package manager or from: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
		else 		# all the rest from here
		    echo "WARNING: Install $i from: https://console.redhat.com/openshift/downloads"
		fi
	fi
done
exit 0
