# FilesApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**filesByNameDelete**](FilesApi.md#filesByNameDelete) | **DELETE** /files/{name} | Delete File
[**filesByNameGet**](FilesApi.md#filesByNameGet) | **GET** /files/{name} | Download File
[**filesByNameInfoGet**](FilesApi.md#filesByNameInfoGet) | **GET** /files/{name}/info | Load File Details
[**filesGet**](FilesApi.md#filesGet) | **GET** /files | List Files
[**filesPost**](FilesApi.md#filesPost) | **POST** /files | Upload File



## filesByNameDelete

Delete File

Permanently deletes the file from your Account. Required Access Level: ModifyFiles

### Example

```bash
ElasticEmail filesByNameDelete name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your file including extension. | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## filesByNameGet

Download File

Gets content of the specified File. Required Access Level: ViewFiles

### Example

```bash
ElasticEmail filesByNameGet name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your file including extension. | [default to null]

### Return type

**binary**

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## filesByNameInfoGet

Load File Details

Returns the specified File's details. Required Access Level: ViewFiles

### Example

```bash
ElasticEmail filesByNameInfoGet name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your file including extension. | [default to null]

### Return type

[**FileInfo**](FileInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## filesGet

List Files

Returns a list of all your available files. Required Access Level: ViewFiles

### Example

```bash
ElasticEmail filesGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[FileInfo]**](FileInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## filesPost

Upload File

Uploads selected file to the server. Required Access Level: ModifyFiles

### Example

```bash
ElasticEmail filesPost  expiresAfterDays=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filePayload** | [**FilePayload**](FilePayload.md) |  |
 **expiresAfterDays** | **integer** | After how many days should the file be deleted. | [optional] [default to null]

### Return type

[**FileInfo**](FileInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

