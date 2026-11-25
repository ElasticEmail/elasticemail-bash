#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=contactsExportPost

fileName="exported.csv"
fileFormat="Csv"
compressionFormat="Zip"

emails=("johnsmith@domain.com" "johndoe@domain.com")

emailsParams=()

for email in "${emails[@]}"
do
    emailsParams+=("emails=$email")
done

./ElasticEmail --host "$host" "$apiMethod" "$apiKeyHeader" fileFormat="$fileFormat" fileName="$fileName" compressionFormat="$compressionFormat" "${emailsParams[@]}"
