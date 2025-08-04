#!/bin/bash

curl -X POST \
  -H "Content-Type: application/json" \
  -H "X-GitHub-Event: push" \
  -d @payload.json \
  https://el-python-sample-python-sample.apps.cluster-7vk2v.dynamic.redhatworkshops.io
