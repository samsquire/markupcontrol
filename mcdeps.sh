#!/bin/bash

FILE="$1"
printf "${FILE}:"
xml sel -t -m "//sam//@name" -o "./sections/" -v '.' -n "$FILE" | tr '\n' ' '
echo
