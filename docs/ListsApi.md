# ListsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listsByNameContactsPost**](ListsApi.md#listsByNameContactsPost) | **POST** /lists/{name}/contacts | Add Contacts to List
[**listsByNameContactsRemovePost**](ListsApi.md#listsByNameContactsRemovePost) | **POST** /lists/{name}/contacts/remove | Remove Contacts from List
[**listsByNameDelete**](ListsApi.md#listsByNameDelete) | **DELETE** /lists/{name} | Delete List
[**listsByNameGet**](ListsApi.md#listsByNameGet) | **GET** /lists/{name} | Load List
[**listsByNamePut**](ListsApi.md#listsByNamePut) | **PUT** /lists/{name} | Update List
[**listsGet**](ListsApi.md#listsGet) | **GET** /lists | Load Lists
[**listsPost**](ListsApi.md#listsPost) | **POST** /lists | Add List



## listsByNameContactsPost

Add Contacts to List

Add existing Contacts to specified list. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail listsByNameContactsPost name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your list. | [default to null]
 **emailsPayload** | [**EmailsPayload**](EmailsPayload.md) | Provide either rule or a list of emails, not both. |

### Return type

[**ContactsList**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listsByNameContactsRemovePost

Remove Contacts from List

Remove specified Contacts from your list. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail listsByNameContactsRemovePost name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your list. | [default to null]
 **emailsPayload** | [**EmailsPayload**](EmailsPayload.md) | Provide either rule or a list of emails, not both. |

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listsByNameDelete

Delete List

Deletes List and removes all the Contacts from it (does not delete Contacts). Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail listsByNameDelete name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your list. | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listsByNameGet

Load List

Returns detailed information about specified list. Required Access Level: ViewContacts

### Example

```bash
ElasticEmail listsByNameGet name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your list. | [default to null]

### Return type

[**ContactsList**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listsByNamePut

Update List

Update existing list. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail listsByNamePut name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your list. | [default to null]
 **listUpdatePayload** | [**ListUpdatePayload**](ListUpdatePayload.md) |  |

### Return type

[**ContactsList**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listsGet

Load Lists

Returns all your existing lists. Required Access Level: ViewContacts

### Example

```bash
ElasticEmail listsGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[ContactsList]**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listsPost

Add List

Add a new list. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail listsPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **listPayload** | [**ListPayload**](ListPayload.md) |  |

### Return type

[**ContactsList**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

