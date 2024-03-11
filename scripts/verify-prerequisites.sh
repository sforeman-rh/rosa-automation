#!/bin/bash

exists()
{
	command -v "$1" > /dev/null 2>&1
}

for i in rosa git oc terraform ocm
do
	if ! exists $i; then
		exit 1
	fi
done
exit 0