# SuppressionsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**suppressionsBouncesGet**](SuppressionsApi.md#suppressionsBouncesGet) | **GET** /suppressions/bounces | Get Bounce List
[**suppressionsBouncesImportPost**](SuppressionsApi.md#suppressionsBouncesImportPost) | **POST** /suppressions/bounces/import | Add Bounces Async
[**suppressionsBouncesPost**](SuppressionsApi.md#suppressionsBouncesPost) | **POST** /suppressions/bounces | Add Bounces
[**suppressionsByEmailDelete**](SuppressionsApi.md#suppressionsByEmailDelete) | **DELETE** /suppressions/{email} | Delete Suppression
[**suppressionsByEmailGet**](SuppressionsApi.md#suppressionsByEmailGet) | **GET** /suppressions/{email} | Get Suppression
[**suppressionsComplaintsGet**](SuppressionsApi.md#suppressionsComplaintsGet) | **GET** /suppressions/complaints | Get Complaints List
[**suppressionsComplaintsImportPost**](SuppressionsApi.md#suppressionsComplaintsImportPost) | **POST** /suppressions/complaints/import | Add Complaints Async
[**suppressionsComplaintsPost**](SuppressionsApi.md#suppressionsComplaintsPost) | **POST** /suppressions/complaints | Add Complaints
[**suppressionsGet**](SuppressionsApi.md#suppressionsGet) | **GET** /suppressions | Get Suppressions
[**suppressionsUnsubscribesGet**](SuppressionsApi.md#suppressionsUnsubscribesGet) | **GET** /suppressions/unsubscribes | Get Unsubscribes List
[**suppressionsUnsubscribesImportPost**](SuppressionsApi.md#suppressionsUnsubscribesImportPost) | **POST** /suppressions/unsubscribes/import | Add Unsubscribes Async
[**suppressionsUnsubscribesPost**](SuppressionsApi.md#suppressionsUnsubscribesPost) | **POST** /suppressions/unsubscribes | Add Unsubscribes



## suppressionsBouncesGet

Get Bounce List

Retrieve your list of bounced emails. Required Access Level: ViewContacts, ViewSuppressions

### Example

```bash
ElasticEmail suppressionsBouncesGet  search=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **string** | Text fragment used for searching. | [optional] [default to null]
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsBouncesImportPost

Add Bounces Async

Add Bounced. Required Access Level: ModifyContacts, ModifySuppressions

### Example

```bash
ElasticEmail suppressionsBouncesImportPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **binary** |  | [optional] [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsBouncesPost

Add Bounces

Add Bounced. Required Access Level: ModifyContacts, ModifySuppressions

### Example

```bash
ElasticEmail suppressionsBouncesPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestBody** | [**array[string]**](string.md) | Emails to add as bounces. Limited to 1000 per request |

### Return type

[**array[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsByEmailDelete

Delete Suppression

Delete Suppression. Required Access Level: ViewContacts, ViewSuppressions

### Example

```bash
ElasticEmail suppressionsByEmailDelete email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Proper email address. | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsByEmailGet

Get Suppression

Retrieve your suppression. Required Access Level: ViewContacts, ViewSuppressions

### Example

```bash
ElasticEmail suppressionsByEmailGet email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Proper email address. | [default to null]

### Return type

[**Suppression**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsComplaintsGet

Get Complaints List

Retrieve your list of complaints. Required Access Level: ViewContacts, ViewSuppressions

### Example

```bash
ElasticEmail suppressionsComplaintsGet  search=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **string** | Text fragment used for searching. | [optional] [default to null]
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsComplaintsImportPost

Add Complaints Async

Add Complaints. Required Access Level: ModifyContacts, ModifySuppressions

### Example

```bash
ElasticEmail suppressionsComplaintsImportPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **binary** |  | [optional] [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsComplaintsPost

Add Complaints

Add Complaints. Required Access Level: ModifyContacts, ModifySuppressions

### Example

```bash
ElasticEmail suppressionsComplaintsPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestBody** | [**array[string]**](string.md) | Emails to add as complaints. Limited to 1000 per request |

### Return type

[**array[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsGet

Get Suppressions

Retrieve your suppressions. Required Access Level: ViewContacts, ViewSuppressions

### Example

```bash
ElasticEmail suppressionsGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsUnsubscribesGet

Get Unsubscribes List

Retrieve your list of unsubscribes. Required Access Level: ViewContacts, ViewSuppressions

### Example

```bash
ElasticEmail suppressionsUnsubscribesGet  search=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **string** | Text fragment used for searching. | [optional] [default to null]
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsUnsubscribesImportPost

Add Unsubscribes Async

Add Unsubscribes. Required Access Level: ModifyContacts, ModifySuppressions

### Example

```bash
ElasticEmail suppressionsUnsubscribesImportPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **binary** |  | [optional] [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## suppressionsUnsubscribesPost

Add Unsubscribes

Add Unsubscribes. Required Access Level: ModifyContacts, ModifySuppressions

### Example

```bash
ElasticEmail suppressionsUnsubscribesPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestBody** | [**array[string]**](string.md) | Emails to add as unsubscribes. Limited to 1000 per request |

### Return type

[**array[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

