#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=statisticsChannelsGet

limit=0
offset=0

./ElasticEmail --host $host $apiMethod limit=${limit}  offset=${offset} $apiKeyHeader
