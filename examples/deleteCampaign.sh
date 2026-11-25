#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=campaignsByNameDelete

campaignName="test name 3[]??[]Special_characters!@#$%^&*()222"

campaignNameEncoded=$(jq -rn --arg v "$campaignName" '$v|@uri')

./ElasticEmail --host "$host" "$apiMethod" name="$campaignNameEncoded" "$apiKeyHeader"
