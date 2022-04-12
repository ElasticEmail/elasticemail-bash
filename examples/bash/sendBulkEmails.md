# Send Bulk Emails

This guide will walk you through steps of sending a bulk email using the Bash library. 

*Required Access Level: SendHttp*

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/emailsPost

## What's a bulk email?
When using Elastic Email you send emails to your contacts. One of options is to send bulk emails. Bulk email can be described as a single email message send to a large group at once.

## Preparation
It's a Bash script so it's a program to be run by Unix shell. On linux (eg. Ubuntu) there's no need to install anything additional. 

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

Use your API key (remember to check a required access level):

```bash
apiKey=YOUR_API_KEY
```

and create header variables for api key:
```bash
apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey
```

Define a method that will be used:
```
apiMethod=emailsPost
```

First you need to specify email details:
- email recipients:
    - this example demostrates merge fields usage, for each recipient `{name}` will be changed to recipient's name
- email content:
    - body parts – in HTML, PlainText or in both
    - from email – it needs to be your validated email address
    - email subject


```bash
json='{
        Recipients: [
            { 
                Email: "johnsmith@domain.com", 
                Fields: {
                    name: "John"
                }
            }
        ],
        Content: {
            Body: [
                {
                    ContentType: "HTML",
                    Charset: "utf-8",
                    Content: "<strong>Hi {name}!<strong>"
                },
                {
                    ContentType: "PlainText",
                    Charset: "utf-8",
                    Content: "Hi {name}!"
                }
            ],
            From: "myemail@domain.com",
            Subject: "Example transactional email"
        }
    }'
```


And finally, you can use the lib to make an api call:

```bash
echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=emailsPost

json='{
        Recipients: [
            { 
                Email: "johnsmith@domain.com", 
                Fields: {
                    name: "John"
                }
            }
        ],
        Content: {
            Body: [
                {
                    ContentType: "HTML",
                    Charset: "utf-8",
                    Content: "<strong>Hi {name}!<strong>"
                },
                {
                    ContentType: "PlainText",
                    Charset: "utf-8",
                    Content: "Hi {name}!"
                }
            ],
            From: "myemail@domain.com",
            Subject: "Example transactional email"
        }
    }'

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader
```

## Run the code
```
bash script.sh
```
