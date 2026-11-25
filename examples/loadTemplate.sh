#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=templatesByNameGet

templateName="test name 3[]??[]Special_characters!@#$%^&*()222"

templateNameEncoded=$(jq -rn --arg v "$templateName" '$v|@uri')

./ElasticEmail --host "$host" "$apiMethod" name="$templateNameEncoded" "$apiKeyHeader"
