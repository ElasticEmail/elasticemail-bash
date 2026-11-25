#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=contactsDeletePost

json='{ 
        Emails: ["johnsmith@domain.com"]
    }'

echo "$json" | ./ElasticEmail --host "$host" --content-type json "$apiMethod" - "$apiKeyHeader"
