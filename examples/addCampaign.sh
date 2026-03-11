#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=campaignsPost

json='{ 
    Name: "my new campaign2", 
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

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader
