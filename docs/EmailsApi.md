# EmailsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**emailsByMsgidViewGet**](EmailsApi.md#emailsByMsgidViewGet) | **GET** /emails/{msgid}/view | View Email
[**emailsByTransactionidStatusGet**](EmailsApi.md#emailsByTransactionidStatusGet) | **GET** /emails/{transactionid}/status | Get Status
[**emailsMergefilePost**](EmailsApi.md#emailsMergefilePost) | **POST** /emails/mergefile | Send Bulk Emails CSV
[**emailsPost**](EmailsApi.md#emailsPost) | **POST** /emails | Send Bulk Emails
[**emailsTransactionalPost**](EmailsApi.md#emailsTransactionalPost) | **POST** /emails/transactional | Send Transactional Email



## emailsByMsgidViewGet

View Email

Returns email details for viewing or rendering. Required Access Level: None

### Example

```bash
ElasticEmail emailsByMsgidViewGet msgid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **msgid** | **string** | Message identifier | [default to null]

### Return type

[**EmailData**](EmailData.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## emailsByTransactionidStatusGet

Get Status

Get status details of an email transaction. Required Access Level: ViewReports

### Example

```bash
ElasticEmail emailsByTransactionidStatusGet transactionid=value  showFailed=value  showSent=value  showDelivered=value  showPending=value  showOpened=value  showClicked=value  showAbuse=value  showUnsubscribed=value  showErrors=value  showMessageIDs=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transactionid** | **string** | Transaction identifier | [default to null]
 **showFailed** | **boolean** | Include Bounced email addresses. | [optional] [default to false]
 **showSent** | **boolean** | Include Sent email addresses. | [optional] [default to false]
 **showDelivered** | **boolean** | Include all delivered email addresses. | [optional] [default to false]
 **showPending** | **boolean** | Include Ready to send email addresses. | [optional] [default to false]
 **showOpened** | **boolean** | Include Opened email addresses. | [optional] [default to false]
 **showClicked** | **boolean** | Include Clicked email addresses. | [optional] [default to false]
 **showAbuse** | **boolean** | Include Reported as abuse email addresses. | [optional] [default to false]
 **showUnsubscribed** | **boolean** | Include Unsubscribed email addresses. | [optional] [default to false]
 **showErrors** | **boolean** | Include error messages for bounced emails. | [optional] [default to false]
 **showMessageIDs** | **boolean** | Include all MessageIDs for this transaction | [optional] [default to false]

### Return type

[**EmailJobStatus**](EmailJobStatus.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## emailsMergefilePost

Send Bulk Emails CSV

Send bulk merge email. Required Access Level: SendHttp

### Example

```bash
ElasticEmail emailsMergefilePost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mergeEmailPayload** | [**MergeEmailPayload**](MergeEmailPayload.md) | Email data |

### Return type

[**EmailSend**](EmailSend.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## emailsPost

Send Bulk Emails

Send bulk merge email. Required Access Level: SendHttp

### Example

```bash
ElasticEmail emailsPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailMessageData** | [**EmailMessageData**](EmailMessageData.md) | Email data |

### Return type

[**EmailSend**](EmailSend.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## emailsTransactionalPost

Send Transactional Email

Send transactional emails (recipients will be known to each other). Required Access Level: SendHttp

### Example

```bash
ElasticEmail emailsTransactionalPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailTransactionalMessageData** | [**EmailTransactionalMessageData**](EmailTransactionalMessageData.md) | Email data |

### Return type

[**EmailSend**](EmailSend.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

