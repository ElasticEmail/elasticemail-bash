# Delete Campaign

This guide will walk you through steps to delete an existing campaign from your account.

*Required Access Level: ModifyCampaigns*

Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/campaignsByNameDelete

## What's a campaign?
When using Elastic Email, when you send an email to any group of contacts we call that a "campaign".

## Preparation
It's a Bash script so it's a program to be run by Unix shell. On linux (eg. Ubuntu) there's no need to install anything additional except `jq`, which this example uses to URL-encode the name.

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
apiMethod=campaignsByNameDelete
```

The only thing you need to specify is a campaign name

```bash
campaignName="[]??[]Special_characters!@#$%^&*()222"
```

But in case when your name contains some special URL characters you need to properly encode it first. For example you can use `jq` (its `@uri` filter) or any other way you prefer:

```bash
campaignNameEncoded=$(jq -rn --arg v "$campaignName" '$v|@uri')
```


And finally, you can use the lib to make an api call:

```bash
./ElasticEmail --host "$host" "$apiMethod" name="$campaignNameEncoded" "$apiKeyHeader"
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=campaignsByNameDelete

campaignName="[]??[]Special_characters!@#$%^&*()222"

campaignNameEncoded=$(jq -rn --arg v "$campaignName" '$v|@uri')

./ElasticEmail --host "$host" "$apiMethod" name="$campaignNameEncoded" "$apiKeyHeader"
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
bash script.sh
```
