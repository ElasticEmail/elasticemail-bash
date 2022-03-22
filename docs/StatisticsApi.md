# StatisticsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**statisticsCampaignsByNameGet**](StatisticsApi.md#statisticsCampaignsByNameGet) | **GET** /statistics/campaigns/{name} | Load Campaign Stats
[**statisticsCampaignsGet**](StatisticsApi.md#statisticsCampaignsGet) | **GET** /statistics/campaigns | Load Campaigns Stats
[**statisticsChannelsByNameGet**](StatisticsApi.md#statisticsChannelsByNameGet) | **GET** /statistics/channels/{name} | Load Channel Stats
[**statisticsChannelsGet**](StatisticsApi.md#statisticsChannelsGet) | **GET** /statistics/channels | Load Channels Stats
[**statisticsGet**](StatisticsApi.md#statisticsGet) | **GET** /statistics | Load Statistics



## statisticsCampaignsByNameGet

Load Campaign Stats

Retrieve stats of an existing campaign. Required Access Level: ViewChannels

### Example

```bash
ElasticEmail statisticsCampaignsByNameGet name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | The name of the campaign to get. | [default to null]

### Return type

[**ChannelLogStatusSummary**](ChannelLogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## statisticsCampaignsGet

Load Campaigns Stats

Returns a list of your Campaigns' stats. Required Access Level: ViewChannels

### Example

```bash
ElasticEmail statisticsCampaignsGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[ChannelLogStatusSummary]**](ChannelLogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## statisticsChannelsByNameGet

Load Channel Stats

Retrieve an existing channel stats. Required Access Level: ViewChannels

### Example

```bash
ElasticEmail statisticsChannelsByNameGet name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | The name of the channel to get. | [default to null]

### Return type

[**ChannelLogStatusSummary**](ChannelLogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## statisticsChannelsGet

Load Channels Stats

Returns a list of your Channels' stats. Required Access Level: ViewChannels

### Example

```bash
ElasticEmail statisticsChannelsGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[ChannelLogStatusSummary]**](ChannelLogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## statisticsGet

Load Statistics

Returns basic statistics. Required Access Level: ViewReports

### Example

```bash
ElasticEmail statisticsGet  from=value  to=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **string** | Starting date for search in YYYY-MM-DDThh:mm:ss format. | [default to null]
 **to** | **string** | Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] [default to null]

### Return type

[**LogStatusSummary**](LogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

