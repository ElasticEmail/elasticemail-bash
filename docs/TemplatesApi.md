# TemplatesApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**templatesByNameDelete**](TemplatesApi.md#templatesByNameDelete) | **DELETE** /templates/{name} | Delete Template
[**templatesByNameGet**](TemplatesApi.md#templatesByNameGet) | **GET** /templates/{name} | Load Template
[**templatesByNamePut**](TemplatesApi.md#templatesByNamePut) | **PUT** /templates/{name} | Update Template
[**templatesGet**](TemplatesApi.md#templatesGet) | **GET** /templates | Load Templates
[**templatesPost**](TemplatesApi.md#templatesPost) | **POST** /templates | Add Template



## templatesByNameDelete

Delete Template

Delete template with the specified name. Required Access Level: ModifyTemplates

### Example

```bash
ElasticEmail templatesByNameDelete name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of template. | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## templatesByNameGet

Load Template

Load detailed information of the specified template. Required Access Level: ViewTemplates

### Example

```bash
ElasticEmail templatesByNameGet name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of template. | [default to null]

### Return type

[**Template**](Template.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## templatesByNamePut

Update Template

Update existing template, overwriting existing data. Required Access Level: ModifyTemplates

### Example

```bash
ElasticEmail templatesByNamePut name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of template. | [default to null]
 **templatePayload** | [**TemplatePayload**](TemplatePayload.md) |  |

### Return type

[**Template**](Template.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## templatesGet

Load Templates

Returns a list of templates for the specified type. Required Access Level: ViewTemplates

### Example

```bash
ElasticEmail templatesGet  Specify as:  scopeType=value1 scopeType=value2 scopeType=...  Specify as:  templateTypes=value1 templateTypes=value2 templateTypes=...  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scopeType** | [**array[TemplateScope]**](TemplateScope.md) | Return templates with specified scope only | [default to null]
 **templateTypes** | [**array[TemplateType]**](TemplateType.md) | Return templates with specified type only | [optional] [default to null]
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[Template]**](Template.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## templatesPost

Add Template

Add a new Template. Required Access Level: ModifyTemplates

### Example

```bash
ElasticEmail templatesPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templatePayload** | [**TemplatePayload**](TemplatePayload.md) |  |

### Return type

[**Template**](Template.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

