# Update Campaign

This guide will walk you through steps to update an existing campaign on your account.

*Required Access Level: ModifyCampaigns*

## What's a campaign?
When using Elastic Email, when you send an email to any group of contacts we call that a "campaign".

https://elasticemail.com/developers/api-documentation/rest-api#operation/campaignsByNamePut

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
apiMethod=campaignsByNamePut
```

Define what campaign to update:

```bash
campaignName="my new campaign"
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
    Name: "my campaign", 
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
echo $json | ./ElasticEmail --host $host --content-type json $apiMethod name="$campaignNameEncoded" - $apiKeyHeader
```

## The whole code to copy and paste:

```bash
#!/bin/bash

host=https://api.elasticemail.com

apiKey=YOUR_API_KEY

apiKeyHeaderName=X-ElasticEmail-ApiKey
apiKeyHeader=$apiKeyHeaderName:$apiKey

apiMethod=campaignsByNamePut

campaignName="my new campaign"

campaignNameEncoded=$(node -p "encodeURIComponent('$campaignName')")

json='{ 
    Name: "my campaign", 
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

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod name="$campaignNameEncoded" - $apiKeyHeader
```

## Run the code
```
bash script.sh
```
