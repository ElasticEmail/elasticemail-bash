# SegmentsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**segmentsByNameDelete**](SegmentsApi.md#segmentsByNameDelete) | **DELETE** /segments/{name} | Delete Segment
[**segmentsByNameGet**](SegmentsApi.md#segmentsByNameGet) | **GET** /segments/{name} | Load Segment
[**segmentsByNamePut**](SegmentsApi.md#segmentsByNamePut) | **PUT** /segments/{name} | Update Segment
[**segmentsGet**](SegmentsApi.md#segmentsGet) | **GET** /segments | Load Segments
[**segmentsPost**](SegmentsApi.md#segmentsPost) | **POST** /segments | Add Segment



## segmentsByNameDelete

Delete Segment

Delete an existing segment. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail segmentsByNameDelete name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your segment. | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## segmentsByNameGet

Load Segment

Returns details for the specified segment. Required Access Level: ViewContacts

### Example

```bash
ElasticEmail segmentsByNameGet name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of the segment you want to load. Will load all contacts if the 'All Contacts' name has been provided | [default to null]

### Return type

[**Segment**](Segment.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## segmentsByNamePut

Update Segment

Rename or change RULE for your segment. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail segmentsByNamePut name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of your segment. | [default to null]
 **segmentPayload** | [**SegmentPayload**](SegmentPayload.md) |  |

### Return type

[**Segment**](Segment.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## segmentsGet

Load Segments

Returns a list of all your available Segments. Required Access Level: ViewContacts

### Example

```bash
ElasticEmail segmentsGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[Segment]**](Segment.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## segmentsPost

Add Segment

Add a new segment, based on specified RULE. Required Access Level: ModifyContacts

### Example

```bash
ElasticEmail segmentsPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **segmentPayload** | [**SegmentPayload**](SegmentPayload.md) |  |

### Return type

[**Segment**](Segment.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

