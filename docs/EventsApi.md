# EventsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**eventsByTransactionidGet**](EventsApi.md#eventsByTransactionidGet) | **GET** /events/{transactionid} | Load Email Events
[**eventsChannelsByNameExportPost**](EventsApi.md#eventsChannelsByNameExportPost) | **POST** /events/channels/{name}/export | Export Channel Events
[**eventsChannelsByNameGet**](EventsApi.md#eventsChannelsByNameGet) | **GET** /events/channels/{name} | Load Channel Events
[**eventsChannelsExportByIdStatusGet**](EventsApi.md#eventsChannelsExportByIdStatusGet) | **GET** /events/channels/export/{id}/status | Check Channel Export Status
[**eventsExportByIdStatusGet**](EventsApi.md#eventsExportByIdStatusGet) | **GET** /events/export/{id}/status | Check Export Status
[**eventsExportPost**](EventsApi.md#eventsExportPost) | **POST** /events/export | Export Events
[**eventsGet**](EventsApi.md#eventsGet) | **GET** /events | Load Events



## eventsByTransactionidGet

Load Email Events

Returns a log of delivery events for the specific transaction ID. Required Access Level: ViewReports

### Example

```bash
ElasticEmail eventsByTransactionidGet transactionid=value  from=value  to=value  orderBy=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transactionid** | **string** | ID number of transaction | [default to null]
 **from** | **string** | Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **to** | **string** | Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **orderBy** | [**EventsOrderBy**](.md) |  | [optional] [default to null]
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[RecipientEvent]**](RecipientEvent.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## eventsChannelsByNameExportPost

Export Channel Events

Export delivery events log information to the specified file format. Required Access Level: Export

### Example

```bash
ElasticEmail eventsChannelsByNameExportPost name=value  Specify as:  eventTypes=value1 eventTypes=value2 eventTypes=...  from=value  to=value  fileFormat=value  compressionFormat=value  fileName=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of selected channel. | [default to null]
 **eventTypes** | [**array[EventType]**](EventType.md) | Types of Events to return | [optional] [default to null]
 **from** | **string** | Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **to** | **string** | Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **fileFormat** | [**ExportFileFormats**](.md) | Format of the exported file | [optional] [default to null]
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


## eventsChannelsByNameGet

Load Channel Events

Returns a log of delivery events filtered by specified parameters. Required Access Level: ViewReports

### Example

```bash
ElasticEmail eventsChannelsByNameGet name=value  Specify as:  eventTypes=value1 eventTypes=value2 eventTypes=...  from=value  to=value  orderBy=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of selected channel. | [default to null]
 **eventTypes** | [**array[EventType]**](EventType.md) | Types of Events to return | [optional] [default to null]
 **from** | **string** | Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **to** | **string** | Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **orderBy** | [**EventsOrderBy**](.md) |  | [optional] [default to null]
 **limit** | **integer** | How many items to load. Maximum for this request is 1000 items | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[RecipientEvent]**](RecipientEvent.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## eventsChannelsExportByIdStatusGet

Check Channel Export Status

Check the current status of the channel export. Required Access Level: Export

### Example

```bash
ElasticEmail eventsChannelsExportByIdStatusGet id=value
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


## eventsExportByIdStatusGet

Check Export Status

Check the current status of the export. Required Access Level: Export

### Example

```bash
ElasticEmail eventsExportByIdStatusGet id=value
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


## eventsExportPost

Export Events

Export delivery events log information to the specified file format. Required Access Level: Export

### Example

```bash
ElasticEmail eventsExportPost  Specify as:  eventTypes=value1 eventTypes=value2 eventTypes=...  from=value  to=value  fileFormat=value  compressionFormat=value  fileName=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventTypes** | [**array[EventType]**](EventType.md) | Types of Events to return | [optional] [default to null]
 **from** | **string** | Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **to** | **string** | Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **fileFormat** | [**ExportFileFormats**](.md) | Format of the exported file | [optional] [default to null]
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


## eventsGet

Load Events

Returns a log of delivery events filtered by specified parameters. Required Access Level: ViewReports

### Example

```bash
ElasticEmail eventsGet  Specify as:  eventTypes=value1 eventTypes=value2 eventTypes=...  from=value  to=value  orderBy=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventTypes** | [**array[EventType]**](EventType.md) | Types of Events to return | [optional] [default to null]
 **from** | **string** | Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **to** | **string** | Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]
 **orderBy** | [**EventsOrderBy**](.md) |  | [optional] [default to null]
 **limit** | **integer** | How many items to load. Maximum for this request is 1000 items | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[RecipientEvent]**](RecipientEvent.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

