#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethodUrl="$host/v4/contacts/import"

file="@contacts.csv"

encodingName="utf-8"

listName="a2"

listNameEncoded=$(node -p "encodeURIComponent('$listName')") # output: "%5B%5D%3F%3F%5B%5DSpecial_characters%21%40%23%24%25%5E%26%2A%28%29222%0A"

curl -F file=$file   -H "$apiKeyHeader"   -X POST "$apiMethodUrl?encodingName=$encodingName&listName=$listNameEncoded"
