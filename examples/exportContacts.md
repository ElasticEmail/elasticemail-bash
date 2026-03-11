# Export Contacts

This guide will walk you through the process of exporting selected contacts to downloadable file using the Bash library. 

*Required Access Level: Export*

Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsExportPost

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
apiMethod=campaignsPost
```

Specify options:
- fileFormat - specify format in which file should be created, options are: "Csv" "Xml" "Json".
- emails - select contacts to export by providing array of emails
- fileName - you can specify file name of your choice

Other options:
- rule - eg. `rule=Status%20=%20Engaged` – Query used for filtering
- compressionFormat - "None" "Zip"


```bash
fileName="exported.csv"
fileFormat="Csv"
compressionFormat="Zip"
```

Define emails to be exported:

```bash
emails=("johnsmith@domain.com" "karol.szczycinski@elasticemail.com")
```

Let's transform it to format required by the lib `emails=value1 emails=value2 emails=...`:

```bash
emailsParams=""

for email in "${emails[@]}"
do
    emailsParams="emails=\"$email\" $emailsParams "
done
```

And finally, you can use the lib to make an api call:

```bash
./ElasticEmail --host $host $apiMethod $apiKeyHeader fileFormat="$fileFormat" fileName="$fileName" compressionFormat="$compressionFormat" $emailsParams
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=contactsExportPost

fileName="exported.csv"
fileFormat="Csv"
compressionFormat="Zip"

emails=("johnsmith@domain.com" "johndoe@domain.com")

emailsParams=""

for email in "${emails[@]}"
do
    emailsParams="emails=\"$email\" $emailsParams "
done

./ElasticEmail --host $host $apiMethod $apiKeyHeader fileFormat="$fileFormat" fileName="$fileName" compressionFormat="$compressionFormat" $emailsParams
```

## Run the code
```
bash script.sh
```
