#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=statisticsGet

fromDate="2022-01-17T00:00:00"
toDate="2023-01-17T00:00:00"

./ElasticEmail --host $host $apiMethod from=${fromDate}  to=${toDate} $apiKeyHeader
