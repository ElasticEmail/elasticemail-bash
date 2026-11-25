#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=contactsByEmailDelete

email="johnsmith@domain.com"

./ElasticEmail --host "$host" "$apiMethod" email="$email" "$apiKeyHeader"
