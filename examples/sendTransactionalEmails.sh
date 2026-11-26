#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

# README:BEGIN quickstart
apiMethod=emailsTransactionalPost

json='{
        Recipients: {
            To: ["johnsmith@domain.com"]
        },
        Content: {
            Body: [
                {
                    ContentType: "HTML",
                    Charset: "utf-8",
                    Content: "<strong>Mail content.<strong>"
                },
                {
                    ContentType: "PlainText",
                    Charset: "utf-8",
                    Content: "Mail content."
                }
            ],
            From: "myemail@domain.com",
            Subject: "Example transactional email"
        }
    }'

# One new key per send; reuse it only to retry this same send with the same body.
idempotencyKey=$(uuidgen | tr '[:upper:]' '[:lower:]')

response=$(echo "$json" | ./ElasticEmail --host "$host" --content-type json "$apiMethod" - "$apiKeyHeader" "Idempotency-Key:$idempotencyKey")

echo "$response"
echo "TransactionID: $(jq -r .TransactionID <<<"$response")  Idempotency-Key: $idempotencyKey"
# README:END quickstart
