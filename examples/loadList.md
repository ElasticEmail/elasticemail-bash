# Load List

This guide will walk you through the process of loading details about contacts list on your account using the Bash library. 

*Required Access Level: ViewContacts*

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/listsByNameGet

## What's a list?
When using Elastic Email, you send emails to contacts – recipients who receive your emails. Contacts can be grouped by created segments or lists. Segments add contacts automatically when specfied conditions are met, and contacts on lists are managed manually.

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
apiMethod=listsByNameGet
```

The only thing you need to specify is a list name

```bash
listName="test name 3[]??[]Special_characters!@#$%^&*()222"
```

But in case when your name contains some special URL characters you need to properly encode it first. For example you can use `jq` (its `@uri` filter) or any other way you prefer:

```bash
listNameEncoded=$(jq -rn --arg v "$listName" '$v|@uri')
```

And finally, you can use the lib to make an api call:

```bash
./ElasticEmail --host "$host" "$apiMethod" name="$listNameEncoded" "$apiKeyHeader"
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=listsByNameGet

listName="test name 3[]??[]Special_characters!@#$%^&*()222"

listNameEncoded=$(jq -rn --arg v "$listName" '$v|@uri')

./ElasticEmail --host "$host" "$apiMethod" name="$listNameEncoded" "$apiKeyHeader"
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
bash script.sh
```
