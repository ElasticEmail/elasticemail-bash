# Send Transactional Emails

This guide will walk you through steps of sending a transactional email using the Bash library. 

*Required Access Level: SendHttp*

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/emailsTransactionalPost

## What's a transactional email?
When using Elastic Email you send emails to your contacts. One of options is to send transational emails. Transactional emails can be described that they are emails generated as a response to a particular actions done by the subscriber eg. account changes, purchase receipts, other confirmations.

A transactional email have a limit of 50 maximum recipients.

## Preparation
It's a Bash script so it's a program to be run by Unix shell. On linux (eg. Ubuntu) there's no need to install anything additional except `jq`, which this example uses to read the response, and `uuidgen` (preinstalled on macOS and most Linux distributions).

Create a new file eg. `script.sh`

Download the lib from ElasticEmail repository https://github.com/ElasticEmail/elasticemail-bash and make sure the script has executable rights
```
$ chmod u+x ElasticEmail
```

## Let's dig into the code

Put the below code to your file.

In the first line indicate that it's a bash script:

```bash
#!/bin/bash
```

Variable for host value:

```bash
host=https://api.elasticemail.com
```

Read your API key from the `ELASTICEMAIL_API_KEY` environment variable (remember to check a required access level). The script stops with an error if the variable is not set:

```bash
apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"
```

and create header variables for api key:
```bash
apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey
```

Define a method that will be used:
```
apiMethod=emailsTransactionalPost
```

First you need to specify email details:
- email recipients
- email content:
    - body parts – in HTML, PlainText or in both
    - from email – it needs to be your validated email address
    - email subject


```bash
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
```


And finally, you can use the lib to make an api call. Pass an `Idempotency-Key` header with a new UUID, so the send can be retried after a timeout without delivering the email twice: a retry with the same key and the same body gets the stored response. `jq` reads the `TransactionID` from the response:

```bash
# One new key per send; reuse it only to retry this same send with the same body.
idempotencyKey=$(uuidgen | tr '[:upper:]' '[:lower:]')

response=$(echo "$json" | ./ElasticEmail --host "$host" --content-type json "$apiMethod" - "$apiKeyHeader" "Idempotency-Key:$idempotencyKey")

echo "$response"
echo "TransactionID: $(jq -r .TransactionID <<<"$response")  Idempotency-Key: $idempotencyKey"
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

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

# One new key per send; reuse it only to retry this same send with the same body.
idempotencyKey=$(uuidgen | tr '[:upper:]' '[:lower:]')

response=$(echo "$json" | ./ElasticEmail --host "$host" --content-type json "$apiMethod" - "$apiKeyHeader" "Idempotency-Key:$idempotencyKey")

echo "$response"
echo "TransactionID: $(jq -r .TransactionID <<<"$response")  Idempotency-Key: $idempotencyKey"
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
bash script.sh
```
