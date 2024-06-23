#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

if ! command -v ansible-playbook &> /dev/null; then
  echo "Command ansible-playbook could not be found!"
  echo
  echo "You can install ansible by below commands:"
  echo
  echo "  pipx install --include-deps ansible"
  exit 1
fi

ANSIBLE_PLAYBOOK_ARGS=()

function usage() {
  echo "Usage: setup.sh [OPTIONS]"
  echo
  echo "Options:"
  echo ""
  echo "--help   Show this message and exit"
  echo "--check  Run the playbook in check mode (default: false)"
  exit 0
}

# idiomatic parameter and option handling in sh
while test $# -gt 0; do
  case "$1" in
      --check) ANSIBLE_PLAYBOOK_ARGS+=("--check");;
      --help) usage;;
      --*) echo "bad option $1";;
        *) usage;;
  esac
  shift
done

cd ./ansible
ansible-galaxy collection install -r requirements.yml --upgrade
ansible-playbook --ask-become-pass setup.yml ${ANSIBLE_PLAYBOOK_ARGS[@]}
