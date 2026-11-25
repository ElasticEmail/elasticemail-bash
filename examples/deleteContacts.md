# Delete Contacts

This guide will walk you through steps of deleting several contacts from your account in one call using the Bash library. To delete one contact by its email address, see [deleteContact](deleteContact.md).

*Required Access Level: ModifyContacts*

Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsDeletePost

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
apiMethod=contactsDeletePost
```

Define JSON with emails to delete:

```bash
json='{ 
        Emails: ["johnsmith@domain.com"]
    }'
```

And finally, you can use the lib to make an api call:

```bash
echo "$json" | ./ElasticEmail --host "$host" --content-type json "$apiMethod" - "$apiKeyHeader"
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey="${ELASTICEMAIL_API_KEY:?set ELASTICEMAIL_API_KEY}"

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=contactsDeletePost

json='{ 
        Emails: ["johnsmith@domain.com"]
    }'

echo "$json" | ./ElasticEmail --host "$host" --content-type json "$apiMethod" - "$apiKeyHeader"
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
bash script.sh
```
