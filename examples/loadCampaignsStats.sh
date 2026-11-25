#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=statisticsCampaignsGet

limit=0
offset=0

./ElasticEmail --host "$host" "$apiMethod" limit="${limit}"  offset="${offset}" "$apiKeyHeader"
