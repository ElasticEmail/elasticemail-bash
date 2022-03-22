# EmailsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**emailsByMsgidViewGet**](EmailsApi.md#emailsByMsgidViewGet) | **GET** /emails/{msgid}/view | View Email
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

