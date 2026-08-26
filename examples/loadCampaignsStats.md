# Load Campaigns Statistics

This guide will walk you through steps of loading statistics for each campaign from your account using the Bash library. 

*Required Access Level: ViewChannels*

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/statisticsCampaignsByNameGet

## What statistics are returned?
When using Elastic Email you send email campaigns to your contacts. From that we create statistics reports for you eg. number of emails sent, number of delivered messages,Number of opened messages, number of unsubscribed messages, number of clicked messages etc.

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
apiMethod=apiMethod=statisticsCampaignsGet
```

Campaigns statistics reponse is paginated you need to specfiy pagination options:
- limit – maximum returned items, `limit = 0` means to return everything till the end of the list
- offset – how many items should be skipped from begging

Eg. to return first 20 elements specify pagination options as follows
```
{
    limit: 20,
    offset: 0,
};
```

Let's fetch everthing:

```javascript
const pageinationOptions = {
    limit: 0,
    offset: 0,
};
```

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

apiMethod=statisticsCampaignsGet

limit=0
offset=0

./ElasticEmail --host $host $apiMethod limit=${limit}  offset=${offset} $apiKeyHeader
```

## Run the code
```
bash script.sh
```
