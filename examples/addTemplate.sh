#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=templatesPost

json='{
    Name: "My new template",
    Subject: "Default subject",
    Body: [{
        ContentType: "HTML",
        Charset: "utf-8",
        Content: "My template"
    }],
    TemplateScope: "Personal",
}'

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader
