# ContactsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**contactsByEmailDelete**](ContactsApi.md#contactsByEmailDelete) | **DELETE** /contacts/{email} | Delete Contact
[**contactsByEmailGet**](ContactsApi.md#contactsByEmailGet) | **GET** /contacts/{email} | Load Contact
[**contactsByEmailHistoryGet**](ContactsApi.md#contactsByEmailHistoryGet) | **GET** /contacts/{email}/history | Load History
[**contactsByEmailPut**](ContactsApi.md#contactsByEmailPut) | **PUT** /contacts/{email} | Update Contact
[**contactsDeletePost**](ContactsApi.md#contactsDeletePost) | **POST** /contacts/delete | Delete Contacts Bulk
[**contactsExportByIdStatusGet**](ContactsApi.md#contactsExportByIdStatusGet) | **GET** /contacts/export/{id}/status | Check Export Status
[**contactsExportPost**](ContactsApi.md#contactsExportPost) | **POST** /contacts/export | Export Contacts
[**contactsGet**](ContactsApi.md#contactsGet) | **GET** /contacts | Load Contacts
[**contactsImportPost**](ContactsApi.md#contactsImportPost) | **POST** /contacts/import | Upload Contacts
[**contactsPost**](ContactsApi.md#contactsPost) | **POST** /contacts | Add Contact



## contactsByEmailDelete

Delete Contact

Deletes the provided contact. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail contactsByEmailDelete email=value
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


## contactsByEmailGet

Load Contact

Load detailed contact information for specified email. Required Access Level: ViewContacts

### Example

```bash
ElasticEmail contactsByEmailGet email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Proper email address. | [default to null]

### Return type

[**Contact**](Contact.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## contactsByEmailHistoryGet

Load History

Returns detailed history of specified Contact. Required Access Level: ViewContacts

### Example

```bash
ElasticEmail contactsByEmailHistoryGet email=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Proper email address. | [default to null]
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[ContactHistory]**](ContactHistory.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## contactsByEmailPut

Update Contact

Update selected contact. Omitted contact's fields will not be changed. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail contactsByEmailPut email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Proper email address. | [default to null]
 **contactUpdatePayload** | [**ContactUpdatePayload**](ContactUpdatePayload.md) |  |

### Return type

[**Contact**](Contact.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## contactsDeletePost

Delete Contacts Bulk

Deletes provided contacts in bulk. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail contactsDeletePost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailsPayload** | [**EmailsPayload**](EmailsPayload.md) | Provide either rule or a list of emails, not both. |

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## contactsExportByIdStatusGet

Check Export Status

Check the current status of the export. Required Access Level: Export

### Example

```bash
ElasticEmail contactsExportByIdStatusGet id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the exported file | [default to null]

### Return type

[**ExportStatus**](ExportStatus.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## contactsExportPost

Export Contacts

Request an Export of specified Contacts. Required Access Level: Export

### Example

```bash
ElasticEmail contactsExportPost  fileFormat=value  rule=value  Specify as:  emails=value1 emails=value2 emails=...  compressionFormat=value  fileName=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fileFormat** | [**ExportFileFormats**](.md) | Format of the exported file | [optional] [default to null]
 **rule** | **string** | Query used for filtering. | [optional] [default to null]
 **emails** | [**array[string]**](string.md) | Comma delimited list of contact emails | [optional] [default to null]
 **compressionFormat** | [**CompressionFormat**](.md) | FileResponse compression format. None or Zip. | [optional] [default to null]
 **fileName** | **string** | Name of your file including extension. | [optional] [default to null]

### Return type

[**ExportLink**](ExportLink.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## contactsGet

Load Contacts

Returns a list of contacts. Required Access Level: ViewContacts

### Example

```bash
ElasticEmail contactsGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[Contact]**](Contact.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## contactsImportPost

Upload Contacts

Upload contacts from a file. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail contactsImportPost  listName=value  encodingName=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **listName** | **string** | Name of an existing list to add these contacts to | [optional] [default to null]
 **encodingName** | **string** | In what encoding the file is uploaded | [optional] [default to null]
 **file** | **binary** |  | [optional] [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## contactsPost

Add Contact

Add new Contacts to your Lists. Up to 1000 can be added (for more please refer to the import request). Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail contactsPost  Specify as:  listnames=value1 listnames=value2 listnames=...
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **contactPayload** | [**array[ContactPayload]**](ContactPayload.md) |  |
 **listnames** | [**array[string]**](string.md) | Names of lists to which the uploaded contacts should be added to | [optional] [default to null]

### Return type

[**array[Contact]**](Contact.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

