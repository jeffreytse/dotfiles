#!/usr/bin/env bash

if ! command -v ansible-playbook &> /dev/null; then
  echo "Command ansible-playbook could not be found!"
  echo
  echo "You can install ansible by below commands:"
  echo
  echo "  pipx install --include-deps ansible"
  exit 1
fi

cd ./ansible && ansible-playbook --ask-become-pass setup.yml
