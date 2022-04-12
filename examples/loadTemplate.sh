#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=templatesByNameGet

templateName="test name 3[]??[]Special_characters!@#$%^&*()222"

templateNameEncoded=$(node -p "encodeURIComponent('$templateName')") # output: "%5B%5D%3F%3F%5B%5DSpecial_characters%21%40%23%24%25%5E%26%2A%28%29222%0A"

./ElasticEmail --host $host $apiMethod name="$templateNameEncoded" $apiKeyHeader
