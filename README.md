<div align="center">

<img src=".github/ee-logo.png" alt="Elastic Email" width="96" />

# Elastic Email Bash SDK

The official Bash command-line client for the [Elastic Email](https://elasticemail.com) REST API v4.

[![Bash](https://img.shields.io/badge/Bash-4.3%2B-4EAA25?logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)
[![cURL](https://img.shields.io/badge/requires-cURL-073551?logo=curl&logoColor=white)](https://curl.se)
[![API](https://img.shields.io/badge/API-v4-0A7BBB)](https://elasticemail.com/developers/api-documentation/rest-api)
[![OpenAPI Generator](https://img.shields.io/badge/generated%20by-OpenAPI%20Generator-6BA539?logo=openapiinitiative&logoColor=white)](https://openapi-generator.tech)
[![License: MIT](https://img.shields.io/github/license/ElasticEmail/elasticemail-bash?color=yellow)](LICENSE)

[![Latest release](https://img.shields.io/github/v/release/ElasticEmail/elasticemail-bash?logo=github&label=release)](https://github.com/ElasticEmail/elasticemail-bash/releases)
[![Last commit](https://img.shields.io/github/last-commit/ElasticEmail/elasticemail-bash?logo=github)](https://github.com/ElasticEmail/elasticemail-bash/commits/master)
[![Open issues](https://img.shields.io/github/issues/ElasticEmail/elasticemail-bash?logo=github)](https://github.com/ElasticEmail/elasticemail-bash/issues)
[![GitHub stars](https://img.shields.io/github/stars/ElasticEmail/elasticemail-bash?style=flat&logo=github)](https://github.com/ElasticEmail/elasticemail-bash/stargazers)

[Installation](#installation) •
[Quick start](#quick-start) •
[Examples](#more-examples) •
[API reference](#api-reference) •
[Models](#models) •
[Contributing](#contributing)

</div>

---

## Features

- **Transactional and bulk email.** Send single messages, bulk campaigns or CSV merge-file sends.
- **Contacts, lists and segments.** Add, update, import, export and bulk-delete contacts.
- **Campaigns and automations.** Create, update, pause and trigger automations for a contact.
- **Templates, files and attachments.** Manage templates and uploaded files.
- **Domains.** Verify sending domains and check SPF, DKIM, tracking and certificate status.
- **Webhooks and inbound routes.** Receive delivery events and route incoming mail.
- **Statistics, events and suppressions.** Track delivery, bounces, complaints and unsubscribes.
- **Subaccounts and security.** Manage subaccounts and API keys.
- **One script, no build step.** A single `ElasticEmail` script built on cURL, with built-in help for every operation, a `--dry-run` mode and Bash/Zsh completion.

## Requirements

| Tool | Version |
| --- | --- |
| Bash | 4.3 or later |
| cURL | Any recent version |
| `column` | From `util-linux` or `bsdmainutils` (preinstalled on macOS and most Linux distributions) |
| OS | Linux, macOS (with a newer Bash, see below), WSL, or the bundled Docker image |

You'll also need an Elastic Email **API key**. You can create one in your [API settings](https://app.elasticemail.com/marketing/settings/new/manage-api). Each endpoint's documentation lists the access level it needs.

> [!NOTE]
> macOS ships with Bash 3.2, which is too old. Install a current Bash with `brew install bash` and run the script with it (`/opt/homebrew/bin/bash ElasticEmail …`, or put Homebrew's `bin` first in your `PATH`).

## Installation

Download the script from the latest [GitHub release](https://github.com/ElasticEmail/elasticemail-bash/releases) and make it executable:

```bash
curl -fsSLO https://raw.githubusercontent.com/ElasticEmail/elasticemail-bash/master/ElasticEmail
chmod u+x ElasticEmail
./ElasticEmail --version
```

Or clone the repository:

```bash
git clone https://github.com/ElasticEmail/elasticemail-bash.git
cd elasticemail-bash
chmod u+x ElasticEmail
```

To run it from anywhere, copy it onto your `PATH`, e.g. `sudo cp ElasticEmail /usr/local/bin/`.

### Docker image

The repository includes a `Dockerfile` with a preconfigured environment (Bash, Zsh and working completion):

```bash
docker build -t elasticemail-cli .
docker run -it elasticemail-cli
```

You start in Zsh, which has richer completion. You can switch to Bash, where basic completion is also available.

### Shell completion

<details>
<summary><strong>Bash</strong></summary>

Load the completion script into the current session:

```bash
source ElasticEmail.bash-completion
```

Or install it system-wide (on macOS with Homebrew, use `$(brew --prefix)/etc/bash_completion.d`):

```bash
sudo cp ElasticEmail.bash-completion /etc/bash_completion.d/ElasticEmail
```

On macOS you might need to install bash-completion first:

```bash
brew install bash-completion
```

and add this to `~/.bashrc`:

```bash
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
fi
```

</details>

<details>
<summary><strong>Zsh</strong></summary>

Copy the `_ElasticEmail` completion file to one of the directories in your `$fpath`, e.g.:

```bash
sudo cp _ElasticEmail /usr/local/share/zsh/site-functions/
```

</details>

## Quick start

> [!IMPORTANT]
> Elastic Email only sends from verified domains. Before your first send, [verify your sending domain](https://help.elasticemail.com/en/articles/4934400-how-to-verify-your-domain) and use an address on that domain as the sender.

### Configure the client

Pass the API host with `--host` (without the `/v4` base path) and the API key as an `X-ElasticEmail-ApiKey` header after the operation name:

```bash
export ELASTICEMAIL_API_KEY="your-api-key"
EE_HOST="https://api.elasticemail.com"

# List available operations, then show help for one
./ElasticEmail -h
./ElasticEmail emailsTransactionalPost -h

# Load the first 10 contacts
./ElasticEmail --host "$EE_HOST" contactsGet limit=10 \
  "X-ElasticEmail-ApiKey:$ELASTICEMAIL_API_KEY"
```

> [!TIP]
> Keep your API key out of scripts and shell history. Load it from an environment variable, a `.env` file that isn't committed, or a secrets manager.

### Send a transactional email

Pipe a JSON body to the operation and pass `-` to read it from stdin:

```bash
cat <<'JSON' | ./ElasticEmail --host "$EE_HOST" --content-type json \
  emailsTransactionalPost - "X-ElasticEmail-ApiKey:$ELASTICEMAIL_API_KEY"
{
  "Recipients": { "To": ["john.doe@example.com"] },
  "Content": {
    "From": "My App <no-reply@yourdomain.com>",
    "Subject": "Welcome aboard!",
    "Body": [
      { "ContentType": "HTML", "Content": "<h1>Hello!</h1><p>Thanks for signing up.</p>" },
      { "ContentType": "PlainText", "Content": "Hello! Thanks for signing up." }
    ]
  }
}
JSON
```

The `From` address must use a domain you've [verified in your Elastic Email account](https://help.elasticemail.com/en/articles/4934400-how-to-verify-your-domain).

### Send from a template with merge fields

```bash
cat <<'JSON' | ./ElasticEmail --host "$EE_HOST" --content-type json \
  emailsTransactionalPost - "X-ElasticEmail-ApiKey:$ELASTICEMAIL_API_KEY"
{
  "Recipients": { "To": ["john.doe@example.com"] },
  "Content": {
    "From": "My App <no-reply@yourdomain.com>",
    "TemplateName": "welcome-template",
    "Merge": { "firstname": "John" }
  }
}
JSON
```

### Preview, proxies and other cURL options

Any cURL option placed **before** the operation name is passed straight to cURL. Add `--dry-run` to print the cURL command instead of running it:

```bash
# Print the request without sending it
./ElasticEmail --host "$EE_HOST" --dry-run contactsGet limit=10 \
  "X-ElasticEmail-ApiKey:$ELASTICEMAIL_API_KEY"

# Go through a proxy, with a 30-second timeout
./ElasticEmail -x http://myProxyUrl:80 --max-time 30 --host "$EE_HOST" \
  contactsGet "X-ElasticEmail-ApiKey:$ELASTICEMAIL_API_KEY"
```

Add `-sS` before the operation name to hide cURL's progress meter but keep error messages.

<details>
<summary><strong>Argument syntax</strong></summary>

After the operation name:

| Form | Meaning |
| --- | --- |
| `KEY=VALUE` | Path or query parameter, e.g. `limit=10`, `email=john.doe@example.com` |
| `HEADER:VALUE` | HTTP header, e.g. `X-ElasticEmail-ApiKey:…` |
| `KEY==VALUE` | Top-level JSON body field (string) |
| `KEY:=VALUE` | Top-level JSON body field (number or boolean) |
| `-` | Read the request body from stdin |

Before the operation name: `--host <url>`, `-ct|--content-type <mime>`, `-ac|--accept <mime>`, `--dry-run`, `--force`, `-nc|--no-colors`, and any cURL option.

</details>

## More examples

Step-by-step scripts for common tasks are in the [`examples/`](examples) folder. Each one has a runnable `.sh` file and a walkthrough.

<details>
<summary><strong>Show all 19 examples</strong></summary>

Script | Walkthrough
--- | ---
[addCampaign](examples/addCampaign.sh) | [readme](examples/addCampaign.md)
[addContacts](examples/addContacts.sh) | [readme](examples/addContacts.md)
[addList](examples/addList.sh) | [readme](examples/addList.md)
[addTemplate](examples/addTemplate.sh) | [readme](examples/addTemplate.md)
[deleteCampaign](examples/deleteCampaign.sh) | [readme](examples/deleteCampaign.md)
[deleteContact](examples/deleteContact.sh) | [readme](examples/deleteContact.md)
[deleteList](examples/deleteList.sh) | [readme](examples/deleteList.md)
[deleteTemplate](examples/deleteTemplate.sh) | [readme](examples/deleteTemplate.md)
[exportContacts](examples/exportContacts.sh) | [readme](examples/exportContacts.md)
[loadCampaign](examples/loadCampaign.sh) | [readme](examples/loadCampaign.md)
[loadCampaignsStats](examples/loadCampaignsStats.sh) | [readme](examples/loadCampaignsStats.md)
[loadChannelsStats](examples/loadChannelsStats.sh) | [readme](examples/loadChannelsStats.md)
[loadList](examples/loadList.sh) | [readme](examples/loadList.md)
[loadStatistics](examples/loadStatistics.sh) | [readme](examples/loadStatistics.md)
[loadTemplate](examples/loadTemplate.sh) | [readme](examples/loadTemplate.md)
[sendBulkEmails](examples/sendBulkEmails.sh) | [readme](examples/sendBulkEmails.md)
[sendTransactionalEmails](examples/sendTransactionalEmails.sh) | [readme](examples/sendTransactionalEmails.md)
[updateCampaign](examples/updateCampaign.sh) | [readme](examples/updateCampaign.md)
[uploadContacts](examples/uploadContacts.sh) | [readme](examples/uploadContacts.md)

</details>

More complete samples in other languages are in the **[Elastic Email examples repository](https://github.com/ElasticEmail/elasticemail-examples)**. It covers transactional email, SMTP, webhooks, inbound email, contacts and serverless platforms across 20+ languages and frameworks.

- ✉️ [SMTP quickstart with `curl`](https://github.com/ElasticEmail/elasticemail-examples/blob/main/smtp-elasticemail-examples/QUICKSTART.md)
- 📂 [All examples](https://github.com/ElasticEmail/elasticemail-examples)

## Authentication

| Scheme | Header | Used for |
| --- | --- | --- |
| `apikey` | `X-ElasticEmail-ApiKey` | All standard API calls |
| `ApiKeyAuthCustomBranding` | `X-Auth-Token` | Custom-branding (white-label) accounts |

Pass the header after the operation name, e.g. `"X-ElasticEmail-ApiKey:$ELASTICEMAIL_API_KEY"`.

## API limits

- Up to **20 concurrent connections** per account
- A hard timeout of **600 seconds** per request

## API reference

All URIs are relative to `https://api.elasticemail.com/v4`. The client covers **114 operations** across 16 API groups: `CampaignsApi`, `ContactsApi`, `DomainsApi`, `EmailsApi`, `EventsApi`, `FilesApi`, `InboundRouteApi`, `ListsApi`, `SecurityApi`, `SegmentsApi`, `StatisticsApi`, `SubAccountsApi`, `SuppressionsApi`, `TemplatesApi`, `VerificationsApi` and `WebhookApi`. Run `./ElasticEmail <operation> -h` for the parameters of any operation.

<details>
<summary><strong>Show all endpoints</strong></summary>


Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*CampaignsApi* | [**campaignsAutomationByNameTriggerPost**](docs/CampaignsApi.md#campaignsautomationbynametriggerpost) | **POST** /campaigns/automation/{name}/trigger | Trigger Automation for Contact
*CampaignsApi* | [**campaignsByNameDelete**](docs/CampaignsApi.md#campaignsbynamedelete) | **DELETE** /campaigns/{name} | Delete Campaign
*CampaignsApi* | [**campaignsByNameGet**](docs/CampaignsApi.md#campaignsbynameget) | **GET** /campaigns/{name} | Load Campaign
*CampaignsApi* | [**campaignsByNamePausePut**](docs/CampaignsApi.md#campaignsbynamepauseput) | **PUT** /campaigns/{name}/pause | Pause Campaign
*CampaignsApi* | [**campaignsByNamePut**](docs/CampaignsApi.md#campaignsbynameput) | **PUT** /campaigns/{name} | Update Campaign
*CampaignsApi* | [**campaignsGet**](docs/CampaignsApi.md#campaignsget) | **GET** /campaigns | Load Campaigns
*CampaignsApi* | [**campaignsPost**](docs/CampaignsApi.md#campaignspost) | **POST** /campaigns | Add Campaign
*ContactsApi* | [**contactsByEmailDelete**](docs/ContactsApi.md#contactsbyemaildelete) | **DELETE** /contacts/{email} | Delete Contact
*ContactsApi* | [**contactsByEmailGet**](docs/ContactsApi.md#contactsbyemailget) | **GET** /contacts/{email} | Load Contact
*ContactsApi* | [**contactsByEmailPut**](docs/ContactsApi.md#contactsbyemailput) | **PUT** /contacts/{email} | Update Contact
*ContactsApi* | [**contactsDeletePost**](docs/ContactsApi.md#contactsdeletepost) | **POST** /contacts/delete | Delete Contacts Bulk
*ContactsApi* | [**contactsExportByIdStatusGet**](docs/ContactsApi.md#contactsexportbyidstatusget) | **GET** /contacts/export/{id}/status | Check Export Status
*ContactsApi* | [**contactsExportPost**](docs/ContactsApi.md#contactsexportpost) | **POST** /contacts/export | Export Contacts
*ContactsApi* | [**contactsGet**](docs/ContactsApi.md#contactsget) | **GET** /contacts | Load Contacts
*ContactsApi* | [**contactsImportPost**](docs/ContactsApi.md#contactsimportpost) | **POST** /contacts/import | Upload Contacts
*ContactsApi* | [**contactsPost**](docs/ContactsApi.md#contactspost) | **POST** /contacts | Add Contact
*DomainsApi* | [**domainsByDomainDelete**](docs/DomainsApi.md#domainsbydomaindelete) | **DELETE** /domains/{domain} | Delete Domain
*DomainsApi* | [**domainsByDomainGet**](docs/DomainsApi.md#domainsbydomainget) | **GET** /domains/{domain} | Load Domain
*DomainsApi* | [**domainsByDomainPut**](docs/DomainsApi.md#domainsbydomainput) | **PUT** /domains/{domain} | Update Domain
*DomainsApi* | [**domainsByDomainRestrictedGet**](docs/DomainsApi.md#domainsbydomainrestrictedget) | **GET** /domains/{domain}/restricted | Check for domain restriction
*DomainsApi* | [**domainsByDomainVerificationPut**](docs/DomainsApi.md#domainsbydomainverificationput) | **PUT** /domains/{domain}/verification | Verify Domain
*DomainsApi* | [**domainsByEmailDefaultPatch**](docs/DomainsApi.md#domainsbyemaildefaultpatch) | **PATCH** /domains/{email}/default | Set Default
*DomainsApi* | [**domainsGet**](docs/DomainsApi.md#domainsget) | **GET** /domains | Load Domains
*DomainsApi* | [**domainsPost**](docs/DomainsApi.md#domainspost) | **POST** /domains | Add Domain
*EmailsApi* | [**emailsByMsgidViewGet**](docs/EmailsApi.md#emailsbymsgidviewget) | **GET** /emails/{msgid}/view | View Email
*EmailsApi* | [**emailsByTransactionidStatusGet**](docs/EmailsApi.md#emailsbytransactionidstatusget) | **GET** /emails/{transactionid}/status | Get Status
*EmailsApi* | [**emailsMergefilePost**](docs/EmailsApi.md#emailsmergefilepost) | **POST** /emails/mergefile | Send Bulk Emails CSV
*EmailsApi* | [**emailsPost**](docs/EmailsApi.md#emailspost) | **POST** /emails | Send Bulk Emails
*EmailsApi* | [**emailsTransactionalPost**](docs/EmailsApi.md#emailstransactionalpost) | **POST** /emails/transactional | Send Transactional Email
*EventsApi* | [**eventsByTransactionidGet**](docs/EventsApi.md#eventsbytransactionidget) | **GET** /events/{transactionid} | Load Email Events
*EventsApi* | [**eventsChannelsByNameExportPost**](docs/EventsApi.md#eventschannelsbynameexportpost) | **POST** /events/channels/{name}/export | Export Channel Events
*EventsApi* | [**eventsChannelsByNameGet**](docs/EventsApi.md#eventschannelsbynameget) | **GET** /events/channels/{name} | Load Channel Events
*EventsApi* | [**eventsChannelsExportByIdStatusGet**](docs/EventsApi.md#eventschannelsexportbyidstatusget) | **GET** /events/channels/export/{id}/status | Check Channel Export Status
*EventsApi* | [**eventsExportByIdStatusGet**](docs/EventsApi.md#eventsexportbyidstatusget) | **GET** /events/export/{id}/status | Check Export Status
*EventsApi* | [**eventsExportPost**](docs/EventsApi.md#eventsexportpost) | **POST** /events/export | Export Events
*EventsApi* | [**eventsGet**](docs/EventsApi.md#eventsget) | **GET** /events | Load Events
*FilesApi* | [**filesByNameDelete**](docs/FilesApi.md#filesbynamedelete) | **DELETE** /files/{name} | Delete File
*FilesApi* | [**filesByNameGet**](docs/FilesApi.md#filesbynameget) | **GET** /files/{name} | Download File
*FilesApi* | [**filesByNameInfoGet**](docs/FilesApi.md#filesbynameinfoget) | **GET** /files/{name}/info | Load File Details
*FilesApi* | [**filesGet**](docs/FilesApi.md#filesget) | **GET** /files | List Files
*FilesApi* | [**filesPost**](docs/FilesApi.md#filespost) | **POST** /files | Upload File
*InboundRouteApi* | [**inboundrouteByIdDelete**](docs/InboundRouteApi.md#inboundroutebyiddelete) | **DELETE** /inboundroute/{id} | Delete Route
*InboundRouteApi* | [**inboundrouteByIdGet**](docs/InboundRouteApi.md#inboundroutebyidget) | **GET** /inboundroute/{id} | Get Route
*InboundRouteApi* | [**inboundrouteByIdPut**](docs/InboundRouteApi.md#inboundroutebyidput) | **PUT** /inboundroute/{id} | Update Route
*InboundRouteApi* | [**inboundrouteGet**](docs/InboundRouteApi.md#inboundrouteget) | **GET** /inboundroute | Get Routes
*InboundRouteApi* | [**inboundrouteOrderPut**](docs/InboundRouteApi.md#inboundrouteorderput) | **PUT** /inboundroute/order | Update Sorting
*InboundRouteApi* | [**inboundroutePost**](docs/InboundRouteApi.md#inboundroutepost) | **POST** /inboundroute | Create Route
*ListsApi* | [**listsByListnameContactsGet**](docs/ListsApi.md#listsbylistnamecontactsget) | **GET** /lists/{listname}/contacts | Load Contacts in List
*ListsApi* | [**listsByNameContactsPost**](docs/ListsApi.md#listsbynamecontactspost) | **POST** /lists/{name}/contacts | Add Contacts to List
*ListsApi* | [**listsByNameContactsRemovePost**](docs/ListsApi.md#listsbynamecontactsremovepost) | **POST** /lists/{name}/contacts/remove | Remove Contacts from List
*ListsApi* | [**listsByNameDelete**](docs/ListsApi.md#listsbynamedelete) | **DELETE** /lists/{name} | Delete List
*ListsApi* | [**listsByNameGet**](docs/ListsApi.md#listsbynameget) | **GET** /lists/{name} | Load List
*ListsApi* | [**listsByNamePut**](docs/ListsApi.md#listsbynameput) | **PUT** /lists/{name} | Update List
*ListsApi* | [**listsGet**](docs/ListsApi.md#listsget) | **GET** /lists | Load Lists
*ListsApi* | [**listsPost**](docs/ListsApi.md#listspost) | **POST** /lists | Add List
*SecurityApi* | [**securityApikeysByNameDelete**](docs/SecurityApi.md#securityapikeysbynamedelete) | **DELETE** /security/apikeys/{name} | Delete ApiKey
*SecurityApi* | [**securityApikeysByNameGet**](docs/SecurityApi.md#securityapikeysbynameget) | **GET** /security/apikeys/{name} | Load ApiKey
*SecurityApi* | [**securityApikeysByNamePut**](docs/SecurityApi.md#securityapikeysbynameput) | **PUT** /security/apikeys/{name} | Update ApiKey
*SecurityApi* | [**securityApikeysGet**](docs/SecurityApi.md#securityapikeysget) | **GET** /security/apikeys | List ApiKeys
*SecurityApi* | [**securityApikeysPost**](docs/SecurityApi.md#securityapikeyspost) | **POST** /security/apikeys | Add ApiKey
*SecurityApi* | [**securitySmtpByNameDelete**](docs/SecurityApi.md#securitysmtpbynamedelete) | **DELETE** /security/smtp/{name} | Delete SMTP Credential
*SecurityApi* | [**securitySmtpByNameGet**](docs/SecurityApi.md#securitysmtpbynameget) | **GET** /security/smtp/{name} | Load SMTP Credential
*SecurityApi* | [**securitySmtpByNamePut**](docs/SecurityApi.md#securitysmtpbynameput) | **PUT** /security/smtp/{name} | Update SMTP Credential
*SecurityApi* | [**securitySmtpGet**](docs/SecurityApi.md#securitysmtpget) | **GET** /security/smtp | List SMTP Credentials
*SecurityApi* | [**securitySmtpPost**](docs/SecurityApi.md#securitysmtppost) | **POST** /security/smtp | Add SMTP Credential
*SegmentsApi* | [**segmentsByNameDelete**](docs/SegmentsApi.md#segmentsbynamedelete) | **DELETE** /segments/{name} | Delete Segment
*SegmentsApi* | [**segmentsByNameGet**](docs/SegmentsApi.md#segmentsbynameget) | **GET** /segments/{name} | Load Segment
*SegmentsApi* | [**segmentsByNamePut**](docs/SegmentsApi.md#segmentsbynameput) | **PUT** /segments/{name} | Update Segment
*SegmentsApi* | [**segmentsGet**](docs/SegmentsApi.md#segmentsget) | **GET** /segments | Load Segments
*SegmentsApi* | [**segmentsPost**](docs/SegmentsApi.md#segmentspost) | **POST** /segments | Add Segment
*StatisticsApi* | [**statisticsCampaignsByNameGet**](docs/StatisticsApi.md#statisticscampaignsbynameget) | **GET** /statistics/campaigns/{name} | Load Campaign Stats
*StatisticsApi* | [**statisticsCampaignsGet**](docs/StatisticsApi.md#statisticscampaignsget) | **GET** /statistics/campaigns | Load Campaigns Stats
*StatisticsApi* | [**statisticsChannelsByNameGet**](docs/StatisticsApi.md#statisticschannelsbynameget) | **GET** /statistics/channels/{name} | Load Channel Stats
*StatisticsApi* | [**statisticsChannelsGet**](docs/StatisticsApi.md#statisticschannelsget) | **GET** /statistics/channels | Load Channels Stats
*StatisticsApi* | [**statisticsGet**](docs/StatisticsApi.md#statisticsget) | **GET** /statistics | Load Statistics
*SubAccountsApi* | [**subaccountsByEmailApikeyGet**](docs/SubAccountsApi.md#subaccountsbyemailapikeyget) | **GET** /subaccounts/{email}/apikey | Get SubAccount ApiKey
*SubAccountsApi* | [**subaccountsByEmailCreditsPatch**](docs/SubAccountsApi.md#subaccountsbyemailcreditspatch) | **PATCH** /subaccounts/{email}/credits | Add, Subtract Email Credits
*SubAccountsApi* | [**subaccountsByEmailDelete**](docs/SubAccountsApi.md#subaccountsbyemaildelete) | **DELETE** /subaccounts/{email} | Delete SubAccount
*SubAccountsApi* | [**subaccountsByEmailGet**](docs/SubAccountsApi.md#subaccountsbyemailget) | **GET** /subaccounts/{email} | Load SubAccount
*SubAccountsApi* | [**subaccountsByEmailSettingsEmailPut**](docs/SubAccountsApi.md#subaccountsbyemailsettingsemailput) | **PUT** /subaccounts/{email}/settings/email | Update SubAccount Email Settings
*SubAccountsApi* | [**subaccountsGet**](docs/SubAccountsApi.md#subaccountsget) | **GET** /subaccounts | Load SubAccounts
*SubAccountsApi* | [**subaccountsPost**](docs/SubAccountsApi.md#subaccountspost) | **POST** /subaccounts | Add SubAccount
*SuppressionsApi* | [**suppressionsBouncesGet**](docs/SuppressionsApi.md#suppressionsbouncesget) | **GET** /suppressions/bounces | Get Bounce List
*SuppressionsApi* | [**suppressionsBouncesImportPost**](docs/SuppressionsApi.md#suppressionsbouncesimportpost) | **POST** /suppressions/bounces/import | Add Bounces Async
*SuppressionsApi* | [**suppressionsBouncesPost**](docs/SuppressionsApi.md#suppressionsbouncespost) | **POST** /suppressions/bounces | Add Bounces
*SuppressionsApi* | [**suppressionsByEmailDelete**](docs/SuppressionsApi.md#suppressionsbyemaildelete) | **DELETE** /suppressions/{email} | Delete Suppression
*SuppressionsApi* | [**suppressionsByEmailGet**](docs/SuppressionsApi.md#suppressionsbyemailget) | **GET** /suppressions/{email} | Get Suppression
*SuppressionsApi* | [**suppressionsComplaintsGet**](docs/SuppressionsApi.md#suppressionscomplaintsget) | **GET** /suppressions/complaints | Get Complaints List
*SuppressionsApi* | [**suppressionsComplaintsImportPost**](docs/SuppressionsApi.md#suppressionscomplaintsimportpost) | **POST** /suppressions/complaints/import | Add Complaints Async
*SuppressionsApi* | [**suppressionsComplaintsPost**](docs/SuppressionsApi.md#suppressionscomplaintspost) | **POST** /suppressions/complaints | Add Complaints
*SuppressionsApi* | [**suppressionsGet**](docs/SuppressionsApi.md#suppressionsget) | **GET** /suppressions | Get Suppressions
*SuppressionsApi* | [**suppressionsUnsubscribesGet**](docs/SuppressionsApi.md#suppressionsunsubscribesget) | **GET** /suppressions/unsubscribes | Get Unsubscribes List
*SuppressionsApi* | [**suppressionsUnsubscribesImportPost**](docs/SuppressionsApi.md#suppressionsunsubscribesimportpost) | **POST** /suppressions/unsubscribes/import | Add Unsubscribes Async
*SuppressionsApi* | [**suppressionsUnsubscribesPost**](docs/SuppressionsApi.md#suppressionsunsubscribespost) | **POST** /suppressions/unsubscribes | Add Unsubscribes
*TemplatesApi* | [**templatesByNameDelete**](docs/TemplatesApi.md#templatesbynamedelete) | **DELETE** /templates/{name} | Delete Template
*TemplatesApi* | [**templatesByNameGet**](docs/TemplatesApi.md#templatesbynameget) | **GET** /templates/{name} | Load Template
*TemplatesApi* | [**templatesByNamePut**](docs/TemplatesApi.md#templatesbynameput) | **PUT** /templates/{name} | Update Template
*TemplatesApi* | [**templatesGet**](docs/TemplatesApi.md#templatesget) | **GET** /templates | Load Templates
*TemplatesApi* | [**templatesPost**](docs/TemplatesApi.md#templatespost) | **POST** /templates | Add Template
*VerificationsApi* | [**verificationsByEmailDelete**](docs/VerificationsApi.md#verificationsbyemaildelete) | **DELETE** /verifications/{email} | Delete Email Verification Result
*VerificationsApi* | [**verificationsByEmailGet**](docs/VerificationsApi.md#verificationsbyemailget) | **GET** /verifications/{email} | Get Email Verification Result
*VerificationsApi* | [**verificationsByEmailPost**](docs/VerificationsApi.md#verificationsbyemailpost) | **POST** /verifications/{email} | Verify Email
*VerificationsApi* | [**verificationsFilesByIdDelete**](docs/VerificationsApi.md#verificationsfilesbyiddelete) | **DELETE** /verifications/files/{id} | Delete File Verification Result
*VerificationsApi* | [**verificationsFilesByIdResultDownloadGet**](docs/VerificationsApi.md#verificationsfilesbyidresultdownloadget) | **GET** /verifications/files/{id}/result/download | Download File Verification Result
*VerificationsApi* | [**verificationsFilesByIdResultGet**](docs/VerificationsApi.md#verificationsfilesbyidresultget) | **GET** /verifications/files/{id}/result | Get Detailed File Verification Result
*VerificationsApi* | [**verificationsFilesByIdVerificationPost**](docs/VerificationsApi.md#verificationsfilesbyidverificationpost) | **POST** /verifications/files/{id}/verification | Start verification
*VerificationsApi* | [**verificationsFilesPost**](docs/VerificationsApi.md#verificationsfilespost) | **POST** /verifications/files | Upload File with Emails
*VerificationsApi* | [**verificationsFilesResultGet**](docs/VerificationsApi.md#verificationsfilesresultget) | **GET** /verifications/files/result | Get Files Verification Results
*VerificationsApi* | [**verificationsGet**](docs/VerificationsApi.md#verificationsget) | **GET** /verifications | Get Emails Verification Results
*WebhookApi* | [**webhookByPublicidDelete**](docs/WebhookApi.md#webhookbypubliciddelete) | **DELETE** /webhook/{publicid} | Delete Webhook
*WebhookApi* | [**webhookByPublicidGet**](docs/WebhookApi.md#webhookbypublicidget) | **GET** /webhook/{publicid} | Load Webhook
*WebhookApi* | [**webhookByPublicidPut**](docs/WebhookApi.md#webhookbypublicidput) | **PUT** /webhook/{publicid} | Update Webhook
*WebhookApi* | [**webhookGet**](docs/WebhookApi.md#webhookget) | **GET** /webhook | Load Webhooks
*WebhookApi* | [**webhookPost**](docs/WebhookApi.md#webhookpost) | **POST** /webhook | Add Webhook

</details>

## Models

<details>
<summary><strong>Show all 98 models</strong></summary>

 - [AccessLevel](docs/AccessLevel.md)
 - [AccountStatusEnum](docs/AccountStatusEnum.md)
 - [ApiKey](docs/ApiKey.md)
 - [ApiKeyPayload](docs/ApiKeyPayload.md)
 - [BodyContentType](docs/BodyContentType.md)
 - [BodyPart](docs/BodyPart.md)
 - [Campaign](docs/Campaign.md)
 - [CampaignOptions](docs/CampaignOptions.md)
 - [CampaignRecipient](docs/CampaignRecipient.md)
 - [CampaignStatus](docs/CampaignStatus.md)
 - [CampaignTemplate](docs/CampaignTemplate.md)
 - [CertificateValidationStatus](docs/CertificateValidationStatus.md)
 - [ChannelLogStatusSummary](docs/ChannelLogStatusSummary.md)
 - [CompressionFormat](docs/CompressionFormat.md)
 - [ConsentData](docs/ConsentData.md)
 - [ConsentTracking](docs/ConsentTracking.md)
 - [Contact](docs/Contact.md)
 - [ContactActivity](docs/ContactActivity.md)
 - [ContactPayload](docs/ContactPayload.md)
 - [ContactSource](docs/ContactSource.md)
 - [ContactStatus](docs/ContactStatus.md)
 - [ContactUpdatePayload](docs/ContactUpdatePayload.md)
 - [ContactsList](docs/ContactsList.md)
 - [DKIMRecord](docs/DKIMRecord.md)
 - [DeliveryOptimizationType](docs/DeliveryOptimizationType.md)
 - [DomainData](docs/DomainData.md)
 - [DomainDetail](docs/DomainDetail.md)
 - [DomainOwner](docs/DomainOwner.md)
 - [DomainPayload](docs/DomainPayload.md)
 - [DomainUpdatePayload](docs/DomainUpdatePayload.md)
 - [EmailContent](docs/EmailContent.md)
 - [EmailData](docs/EmailData.md)
 - [EmailJobFailedStatus](docs/EmailJobFailedStatus.md)
 - [EmailJobStatus](docs/EmailJobStatus.md)
 - [EmailMessageData](docs/EmailMessageData.md)
 - [EmailPredictedValidationStatus](docs/EmailPredictedValidationStatus.md)
 - [EmailRecipient](docs/EmailRecipient.md)
 - [EmailSend](docs/EmailSend.md)
 - [EmailStatus](docs/EmailStatus.md)
 - [EmailTransactionalMessageData](docs/EmailTransactionalMessageData.md)
 - [EmailValidationResult](docs/EmailValidationResult.md)
 - [EmailValidationStatus](docs/EmailValidationStatus.md)
 - [EmailView](docs/EmailView.md)
 - [EmailsPayload](docs/EmailsPayload.md)
 - [EncodingType](docs/EncodingType.md)
 - [EventType](docs/EventType.md)
 - [EventsOrderBy](docs/EventsOrderBy.md)
 - [ExportFileFormats](docs/ExportFileFormats.md)
 - [ExportLink](docs/ExportLink.md)
 - [ExportStatus](docs/ExportStatus.md)
 - [FileInfo](docs/FileInfo.md)
 - [FilePayload](docs/FilePayload.md)
 - [FileUploadResult](docs/FileUploadResult.md)
 - [InboundPayload](docs/InboundPayload.md)
 - [InboundRoute](docs/InboundRoute.md)
 - [InboundRouteActionType](docs/InboundRouteActionType.md)
 - [InboundRouteFilterType](docs/InboundRouteFilterType.md)
 - [ListPayload](docs/ListPayload.md)
 - [ListUpdatePayload](docs/ListUpdatePayload.md)
 - [LogJobStatus](docs/LogJobStatus.md)
 - [LogStatusSummary](docs/LogStatusSummary.md)
 - [MergeEmailPayload](docs/MergeEmailPayload.md)
 - [MessageAttachment](docs/MessageAttachment.md)
 - [MessageCategory](docs/MessageCategory.md)
 - [MessageCategoryEnum](docs/MessageCategoryEnum.md)
 - [NewApiKey](docs/NewApiKey.md)
 - [NewSmtpCredentials](docs/NewSmtpCredentials.md)
 - [Options](docs/Options.md)
 - [RecipientEvent](docs/RecipientEvent.md)
 - [Segment](docs/Segment.md)
 - [SegmentPayload](docs/SegmentPayload.md)
 - [SmtpCredentials](docs/SmtpCredentials.md)
 - [SmtpCredentialsPayload](docs/SmtpCredentialsPayload.md)
 - [SortOrderItem](docs/SortOrderItem.md)
 - [SplitOptimizationType](docs/SplitOptimizationType.md)
 - [SplitOptions](docs/SplitOptions.md)
 - [SubAccountInfo](docs/SubAccountInfo.md)
 - [SubaccountEmailCreditsPayload](docs/SubaccountEmailCreditsPayload.md)
 - [SubaccountEmailSettings](docs/SubaccountEmailSettings.md)
 - [SubaccountEmailSettingsPayload](docs/SubaccountEmailSettingsPayload.md)
 - [SubaccountPayload](docs/SubaccountPayload.md)
 - [SubaccountSettingsInfo](docs/SubaccountSettingsInfo.md)
 - [SubaccountSettingsInfoPayload](docs/SubaccountSettingsInfoPayload.md)
 - [Suppression](docs/Suppression.md)
 - [Template](docs/Template.md)
 - [TemplatePayload](docs/TemplatePayload.md)
 - [TemplateScope](docs/TemplateScope.md)
 - [TemplateType](docs/TemplateType.md)
 - [TrackingType](docs/TrackingType.md)
 - [TrackingValidationStatus](docs/TrackingValidationStatus.md)
 - [TransactionalRecipient](docs/TransactionalRecipient.md)
 - [Utm](docs/Utm.md)
 - [VerificationFileResult](docs/VerificationFileResult.md)
 - [VerificationFileResultDetails](docs/VerificationFileResultDetails.md)
 - [VerificationStatus](docs/VerificationStatus.md)
 - [Webhook](docs/Webhook.md)
 - [WebhookCreatePayload](docs/WebhookCreatePayload.md)
 - [WebhookUpdatePayload](docs/WebhookUpdatePayload.md)

</details>

## Known issues

- The generated script also sends your API key as an `X-Auth-Token` header, and the malformed extra header makes cURL print `curl: (3) URL rejected: Malformed input to a URL function`. The request itself is still sent and the API response is returned. Use `--dry-run` to see the exact command.

## Versioning

The client follows the Elastic Email API v4. Versions and release notes are listed in [GitHub Releases](https://github.com/ElasticEmail/elasticemail-bash/releases). The current version is in the [`VERSION`](VERSION) file.

<details>
<summary>Build details</summary>

- API version: 4.0.0
- SDK version: 4.2.0
- Generator version: 7.11.0
- Build package: `org.openapitools.codegen.languages.BashClientCodegen`

</details>

## Contributing

Contributions are welcome! Most of this client is generated from the Elastic Email OpenAPI specification, so please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

- 🐛 [Report a bug](https://github.com/ElasticEmail/elasticemail-bash/issues/new?template=bug_report.md)
- 💡 [Request a feature](https://github.com/ElasticEmail/elasticemail-bash/issues/new?template=feature_request.md)
- 🔒 [Report a security issue](SECURITY.md)

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).

## Support

> [!IMPORTANT]
> The fastest way to get help is the **chat widget on [elasticemail.com](https://elasticemail.com)**. Our support team can help with your account, sending, deliverability and API questions.

- 💬 [Chat with support on elasticemail.com](https://elasticemail.com) (preferred)
- 📚 [API documentation](https://elasticemail.com/developers/api-documentation/rest-api)
- 🧪 [Examples repository](https://github.com/ElasticEmail/elasticemail-examples)
- 🐛 [GitHub issues](https://github.com/ElasticEmail/elasticemail-bash/issues), for bugs in this SDK only

## License

Released under the [MIT License](LICENSE). Copyright © 2021–2026 Elastic Email.
