#!/bin/bash

endpoint="$1"
file="$2"

curl --request PUT --upload-file "$file" -k $endpoint/
