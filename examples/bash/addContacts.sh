#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=contactsPost

listname="New list"

json='[{
        Email: "johnsmith@domain.com",
        FirstName: "John",
        LastName: "Smith"
    }]'

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader listnames="$listname"
