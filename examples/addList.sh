#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=listsPost

json='{
    ListName: "Best contacts",
    AllowUnsubscribe: true,
    Emails: ["johnsmith@domain.com"]
}'

echo "$json" | ./ElasticEmail --host "$host" --content-type json "$apiMethod" - "$apiKeyHeader"
