# Load Statistics

This guide will walk you through steps of loading basic delivery statistics from your account using the Bash library. 

*Required Access Level: ViewReports*

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/statisticsGet

## What statistics are returned?
When using Elastic Email you send emails to your contacts from that we create some statistics reports for you eg. number of emails sent, number of delivered messages, number of bounced messages, number of unsubscribed messages etc.

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
apiMethod=apiMethod=statisticsGet
```

First you need to specify a date range:
- from date
- to date – optional

```bash
fromDate="2022-01-17T00:00:00"
toDate="2023-01-17T00:00:00"
```

Single date format: `YYYY-MM-DDThh:mm:ss`

And finally, you can use the lib to make an api call:

```bash
./ElasticEmail --host $host $apiMethod name="$listNameEncoded" $apiKeyHeader
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=statisticsGet

fromDate="2022-01-17T00:00:00"
toDate="2023-01-17T00:00:00"

./ElasticEmail --host $host $apiMethod from=${fromDate}  to=${toDate} $apiKeyHeader
```

## Run the code
```
bash script.sh
```
