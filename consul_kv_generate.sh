#!/bin/bash

function json {
	jq -n --arg key "$1" --arg value "$2"  '{key: $key, flags: 0, value: $value}'
}

KEY="$(echo $1 |sed s#testing_kv_## |sed s#prod_kv_## |sed s#__#/#g)" ; shift
VALUE="$@"

json $KEY $(echo -n "$VALUE" |base64)
