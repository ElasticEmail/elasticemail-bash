#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=campaignsByNamePut

campaignName="my new campaign"

campaignNameEncoded=$(node -p "encodeURIComponent('$campaignName')")

json='{ 
    Name: "my new campaign3", 
    Status: "Draft", 
    Recipients: { 
        ListNames: ["my list name"]
    },
    Content: [{
            From: "myemail@domain.com",
            ReplyTo: "myemail@domain.com",
            TemplateName: "hello_template",
            Subject: "Hello"
        }]
    }'

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod name="$campaignNameEncoded" - $apiKeyHeader
