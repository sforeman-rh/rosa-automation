#!/bin/bash

exists()
{
	command -v "$1" > /dev/null 2>&1
}

for i in rosa git oc terraform ocm
do
	if ! exists $i; then
		if [ "$1" = "terraform" ]; then
			echo "WARNING: Install $1 from:"
			echo "	https://developer.hashicorp.com/terraform/install"
		fi
		if [ "$1" = "git" ]; then
			echo "WARNING: Install $1 via your platforms package manager or from:"
			echo "	https://git-scm.com/downloads/guis/"
		fi
		echo "WARNING: Install $i from: "
		echo "	https://console.redhat.com/openshift/downloads"
	fi
done
exit 0