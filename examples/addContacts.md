# Add Contacts

This guide will walk you through the process of adding new contacts to your account using the Bash library. 

*Required Access Level: ModifyContacts*

Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsPost

## What's contact?
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
apiMethod=contactsPost
```

Specify an existing list name, otherwise new contacts will be added to all contacts.


```bash
listname="New list"
```

Create an array with new contacts.

You can pass an array with up to 1000 contacts.

The `Email` field is mandatory, the rest is optional.

```bash
json='[{
        Email: "johnsmith@domain.com",
        FirstName: "John",
        LastName: "Smith"
    }]'
```


And finally, you can use the lib to make an api call:

```bash
echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader listnames="$listname"
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=contactsPost

listname="New list"

json='[{
        Email: "johnsmith@domain.com",
        FirstName: "John",
        LastName: "Smith"
    }]'

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader listnames="$listname"
```

## Run the code
```
bash script.sh
```
