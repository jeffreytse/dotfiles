#!/bin/sh

pkill aria2c
aria2c --conf-path="$HOME/.aria2/aria2.conf" -D
