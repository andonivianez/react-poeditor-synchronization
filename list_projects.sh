#!/bin/sh

set -e

export CONFIG_FILE_PATH=$1

lib_path="`pwd`/`dirname $0`"
config_path="`pwd`/$CONFIG_FILE_PATH"

API_KEY=$(cat $config_path | jq -r '. | .api_key')

node -pe 'JSON.parse(process.argv[1]).list' "$(curl -X POST https://poeditor.com/api/ \
     -d api_token="$API_KEY" \
     -d action="list_projects")"
