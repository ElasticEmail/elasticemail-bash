# Upload Contacts

This guide will walk you through the process of adding new contacts to your account, by uploading them from a CSV file, using the Bash library.

*Required Access Level: ModifyContacts*

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsImportPost


## What's a contact?
When using Elastic Email, you send emails to contacts – recipients who receive your emails. Contacts can be grouped by created segments or lists.


## Preparation
It's a Bash script so it's a program to be run by Unix shell. On linux (eg. Ubuntu) there's no need to install anything additional except `jq`, which this example uses to URL-encode the name.

Create a new file eg. `script.sh`

Download the lib from ElasticEmail repository https://github.com/ElasticEmail/elasticemail-bash and make sure the script has executable rights
```
$ chmod u+x ElasticEmail
```

Put a `contacts.csv` file next to the script. There is a sample one in this folder.

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
apiMethod=contactsImportPost
```

Define the CSV file to upload and its encoding:

```bash
file="contacts.csv"

encodingName="utf-8"
```

Optionally, name a list to which the contacts should be added. Otherwise they are only added to all contacts. URL-encode the name in case it contains special characters:

```bash
listName="a2"

listNameEncoded=$(jq -rn --arg v "$listName" '$v|@uri')
```

And finally, you can use the lib to make an api call. The API expects the CSV as a multipart form field called `file`. Named parameters such as `listName=...` become query parameters, but every argument placed before the method name is handed to curl as is, so `-F "file=@$file"` there sends the file as multipart form data. The lib doesn't quote these curl arguments, so use a file path without spaces.

```bash
./ElasticEmail --host "$host" -F "file=@$file" "$apiMethod" listName="$listNameEncoded" encodingName="$encodingName" "$apiKeyHeader"
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=contactsImportPost

# The CSV is sent as a multipart "file" field. The lib passes every argument
# placed before the method name straight to curl, so -F does the upload.
file="contacts.csv"

encodingName="utf-8"

listName="a2"

listNameEncoded=$(jq -rn --arg v "$listName" '$v|@uri')

./ElasticEmail --host "$host" -F "file=@$file" "$apiMethod" listName="$listNameEncoded" encodingName="$encodingName" "$apiKeyHeader"
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
bash script.sh
```
