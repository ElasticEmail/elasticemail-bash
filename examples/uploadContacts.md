# WARNING
**This snippet in this version does not use the Bash lib.**
It uses directly curl.
Karol: I couldn't figure it out how to properly send a file with the lib.

It works fine when file is passed as form data with `-F` param
But the libs seems to only add body params with `-d` param

A not working version:
```
./ElasticEmail --host $host contactsImportPost $apiKeyHeader listName="$listName" encodingName="$encodingName" file:=@contacts.csv
```

It generates eg:
```
curl -d 'file=@contacts.csv'   -H "X-ElasticEmail-ApiKey: API_KEY"   -X POST "https://api.elasticemail.com/v4/contacts/import?listName=a2&encodingName=utf-8"
```

# END OF WARNING

# Upload Contacts

This guide will walk you through the process of adding new contacts to your account, by uploading them from a CSV file, using the NodeJS library. 

*Required Access Level: ModifyContacts*

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsImportPost


## What's a contact?
When using Elastic Email, you send emails to contacts – recipients who receive your emails. Contacts can be grouped by created segments or lists.


## Preparation
It's a Bash script so it's a program to be run by Unix shell. On linux (eg. Ubuntu) there's no need to install anything additional. 

Create a new file eg. `script.sh`

Download the lib from ElasticEmail repository https://github.com/ElasticEmail/elasticemail-bash and make sure the script has executable rights
```
$ chmod u+x ElasticEmail
```

## Let's dig into the code

This code uses curl directly.

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

Define endpoint path:

```bash
apiMethodUrl="$host/v4/contacts/import"
```


Create options with a file name with it's encoding. 
Optionaly a list name to which contacts should be added, otherwise contacts will be added to all contacts.


```bash
file="@contacts.csv"

encodingName="utf-8"
```


And finally, you can use the lib to make an api call:

```bash
curl -F file=$file   -H "$apiKeyHeader"   -X POST "$apiMethodUrl?encodingName=$encodingName&listName=$listNameEncoded"
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethodUrl="$host/v4/contacts/import"

file="@contacts.csv"

encodingName="utf-8"

listName="a2"

listNameEncoded=$(node -p "encodeURIComponent('$listName')") # output: "%5B%5D%3F%3F%5B%5DSpecial_characters%21%40%23%24%25%5E%26%2A%28%29222%0A"

curl -F file=$file   -H "$apiKeyHeader"   -X POST "$apiMethodUrl?encodingName=$encodingName&listName=$listNameEncoded"
```

## Run the code
```
bash script.sh
```
