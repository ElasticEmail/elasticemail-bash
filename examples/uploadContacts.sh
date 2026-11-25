#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=contactsImportPost

# The CSV is sent as a multipart "file" field. The lib passes every argument
# placed before the method name straight to curl, so -F does the upload.
file="contacts.csv"

encodingName="utf-8"

listName="a2"

listNameEncoded=$(jq -rn --arg v "$listName" '$v|@uri')

./ElasticEmail --host "$host" -F "file=@$file" "$apiMethod" listName="$listNameEncoded" encodingName="$encodingName" "$apiKeyHeader"
