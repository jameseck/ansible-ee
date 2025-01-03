#!/bin/bash

set -euo pipefail

EE_ANSIBLE_VERSION=11.1.0

ansible-builder build \
  -v 3 \
  -t test-ee:$EE_ANSIBLE_VERSION

ansible-navigator --pull-policy never \
    --execution-environment-image test-ee:$EE_ANSIBLE_VERSION \
    -m stdout \
    run tests.yml
