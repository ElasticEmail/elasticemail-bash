#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=listsByNameGet

listName="test name 3[]??[]Special_characters!@#$%^&*()222"

listNameEncoded=$(jq -rn --arg v "$listName" '$v|@uri')

./ElasticEmail --host "$host" "$apiMethod" name="$listNameEncoded" "$apiKeyHeader"
