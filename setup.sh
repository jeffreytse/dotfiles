#!/usr/bin/env bash

cd ./ansible && ansible-playbook --ask-become-pass setup.yml
