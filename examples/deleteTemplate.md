# Delete Template

This guide will walk you through steps of deleting existing template from your account using the NodeJS library. 

*Required Access Level: ModifyTemplates*

## What's a template?
When using Elastic Email you send emails to your contacts. A single template is a body of  email prepared and saved under given name. Till it's deleted it can be reused to send any number of emails.

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/templatesByNameDelete

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
apiMethod=templatesByNameDelete
```

The only thing you need to specify is a template name

```bash
templateName="test name 3[]??[]Special_characters!@#$%^&*()222"
```

But in case when your name contains some special URL characters you need to properly encode it first. For example you can use Bash engine and `encodeURIComponent` from JavaScript language for doing that or use other way of your preference:

```bash
templateNameEncoded=$(node -p "encodeURIComponent('$templateName')") # output: "%5B%5D%3F%3F%5B%5DSpecial_characters%21%40%23%24%25%5E%26%2A%28%29222%0A"
```

And finally, you can use the lib to make an api call:

```bash
./ElasticEmail --host $host $apiMethod name="$templateNameEncoded" $apiKeyHeader
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=templatesByNameDelete

templateName="test name 3[]??[]Special_characters!@#$%^&*()222"

templateNameEncoded=$(node -p "encodeURIComponent('$templateName')") # output: "%5B%5D%3F%3F%5B%5DSpecial_characters%21%40%23%24%25%5E%26%2A%28%29222%0A"

./ElasticEmail --host $host $apiMethod name="$templateNameEncoded" $apiKeyHeader
```

## Run the code
```
bash script.sh
```
