# Add Campaign

This guide will walk you through the process of creating a new campaign using the library. 

*Required Access Level: ModifyCampaigns*

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/campaignsPost

## What's a campaign?
When using Elastic Email, when you send an email to any group of contacts we call that a "campaign".

To send a campaign you need a template (which becomes the email body itself) and you need contacts (the recipients who receive the email).

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
apiMethod=contactsExportPost
```

Create an example campaign object:
- Name: defines campaign name by which you can identify it later
- Recipients: define your audience
- Conent: define your message details
- Status: define status in which campaign should be created

Send will be triggered immediately or postponed, depending on given options. 
Because we define `Status` as `Draft`, so in this case it will be postponed and campaign will be added to drafts.


```bash
json='{ 
    Name: "my new campaign2", 
    Status: "Draft", 
    Recipients: { 
        ListNames: ["my list name"]
    },
    Content: [{
            From: "myemail@domain.com",
            ReplyTo: "myemail@domain.com",
            TemplateName: "hello_template",
            Subject: "Hello"
        }]
    }'
```


And finally, you can use the lib to make an api call:

```bash
echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=campaignsPost

json='{ 
    Name: "my new campaign2", 
    Status: "Draft", 
    Recipients: { 
        ListNames: ["my list name"]
    },
    Content: [{
            From: "myemail@domain.com",
            ReplyTo: "myemail@domain.com",
            TemplateName: "hello_template",
            Subject: "Hello"
        }]
    }'

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader
```

## Run the code
```
bash script.sh
```
