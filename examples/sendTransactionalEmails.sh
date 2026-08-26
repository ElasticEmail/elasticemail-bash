#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

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

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader
