# WebhookApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**webhookByPublicidDelete**](WebhookApi.md#webhookByPublicidDelete) | **DELETE** /webhook/{publicid} | Delete Webhook
[**webhookByPublicidGet**](WebhookApi.md#webhookByPublicidGet) | **GET** /webhook/{publicid} | Load Webhook
[**webhookByPublicidPut**](WebhookApi.md#webhookByPublicidPut) | **PUT** /webhook/{publicid} | Update Webhook
[**webhookGet**](WebhookApi.md#webhookGet) | **GET** /webhook | Load Webhooks
[**webhookPost**](WebhookApi.md#webhookPost) | **POST** /webhook | Add Webhook



## webhookByPublicidDelete

Delete Webhook

Delete the specified notifications webhook. Required Access Level: ModifyWebNotifications

### Example

```bash
ElasticEmail webhookByPublicidDelete publicid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **publicid** | **string** |  | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## webhookByPublicidGet

Load Webhook

Load notifications webhook details. Required Access Level: ViewWebNotifications

### Example

```bash
ElasticEmail webhookByPublicidGet publicid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **publicid** | **string** |  | [default to null]

### Return type

[**Webhook**](Webhook.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## webhookByPublicidPut

Update Webhook

Update notification webhook. Required Access Level: ModifyWebNotifications

### Example

```bash
ElasticEmail webhookByPublicidPut publicid=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **publicid** | **string** |  | [default to null]
 **webhookUpdatePayload** | [**WebhookUpdatePayload**](WebhookUpdatePayload.md) |  |

### Return type

[**Webhook**](Webhook.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## webhookGet

Load Webhooks

Returns a list of notification webhooks. Required Access Level: ViewWebNotifications

### Example

```bash
ElasticEmail webhookGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[Webhook]**](Webhook.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## webhookPost

Add Webhook

Add a notification webhook. Required Access Level: ModifyWebNotifications

### Example

```bash
ElasticEmail webhookPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhookCreatePayload** | [**WebhookCreatePayload**](WebhookCreatePayload.md) |  |

### Return type

[**Webhook**](Webhook.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

