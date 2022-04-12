# Add Template

This guide will walk you through the process of adding a new template to your account using the NodeJS library. 

*Required Access Level: ModifyTemplates*

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/templatesPost

## What's a template?
When using Elastic Email you send emails to your contacts. A single template is a body of  email prepared and saved under given name. Till it's deleted it can be reused to send any number of emails.


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
apiMethod=templatesPost
```

Create an object with details about new template:
- Name – name of your template by which it can be identified and used
- Subject – specify default subject for this template
- Body – specify acctual body content eg. in HTML, PlainText or both
- TemplateScope – specify scope, "Personal" template won't be shared, "Global" template can be shared with your sub accounts.

```bash
json='{
    Name: "My new template",
    Subject: "Default subject",
    Body: [{
        ContentType: "HTML",
        Charset: "utf-8",
        Content: "My template"
    }],
    TemplateScope: "Personal",
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

apiMethod=templatesPost

json='{
    Name: "My new template",
    Subject: "Default subject",
    Body: [{
        ContentType: "HTML",
        Charset: "utf-8",
        Content: "My template"
    }],
    TemplateScope: "Personal",
}'

echo $json | ./ElasticEmail --host $host --content-type json $apiMethod - $apiKeyHeader
```

## Run the code
```
bash script.sh
```
