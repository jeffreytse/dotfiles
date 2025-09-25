#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to check if a command exists
function check_command() {
  command -v $1 &> /dev/null
}

# Install Ansible if not present
function install_ansible() {
  case "$OSTYPE" in
    solaris*) echo "SOLARIS";;
    darwin*)
      # Install Homebrew
      if ! check_command brew; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
      brew install ansible
      ;;
    linux*)
      # Install for Ubuntu/Debian
      if check_command apt; then
        sudo apt update
        sudo apt install software-properties-common
        sudo add-apt-repository --yes --update ppa:ansible/ansible
        sudo apt install ansible
      # Install for Red Hat Enterprise Linux/CentOS
      elif check_command yum; then
        sudo yum install epel-release
        sudo yum install ansible
      fi
      ;;
    bsd*)     echo "BSD" ;;
    msys*)    echo "WINDOWS (MSYS/Cygwin)" ;;
    *)        echo "unknown: $OSTYPE" ;;
  esac
}

# Check and install ansible
if ! check_command ansible-playbook; then
  echo "Command ansible-playbook could not be found!"
  if ! install_ansible; then
    exit 1
  fi
fi

# Function to display usage information
function usage() {
  echo "Usage: setup.sh [OPTIONS]"
  echo
  echo "Options:"
  echo ""
  echo "--help   Show this message and exit"
  echo "--check  Run the playbook in check mode (default: false)"
  echo "--playbook <file> Specify the playbook to run (default: setup.yml)"
  exit 0
}

ANSIBLE_PLAYBOOK_ARGS=()
playbook="setup.yml"

# idiomatic parameter and option handling in sh
while test $# -gt 0; do
  case "$1" in
      --check) ANSIBLE_PLAYBOOK_ARGS+=("--check");;
      --help) usage;;
      --playbook)
        playbook="$2"
        if [ -z "$playbook" ]; then
          echo "Error: --playbook requires a file argument."
          exit 1
        fi
        shift
        ;;
      --*) echo "bad option $1";;
        *) usage;;
  esac
  shift
done

read -s -p "BECOME password: " password

cd ./ansible
ansible-galaxy collection install -r requirements.yml --upgrade
ansible-playbook --ask-become-pass --extra-vars="ansible_become_pass='$password'" $playbook ${ANSIBLE_PLAYBOOK_ARGS[@]}
