#!/bin/bash

# Create an empty file called ansible-update.log or clear its content if it already exists
printf '' > /srv/git/bizbox/ansible-update.log

# Update Ansible to a specific version range with additional options
# Redirect both error and regular messages to the ansible-update.log file
python3 -m pip install --no-cache-dir --disable-pip-version-check --upgrade ansible">=6.0.0,<7.0.0" 2>&1 | tee -a /srv/git/bizbox/ansible-update.log
