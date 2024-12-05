# CampaignsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**campaignsByNameDelete**](CampaignsApi.md#campaignsByNameDelete) | **DELETE** /campaigns/{name} | Delete Campaign
[**campaignsByNameGet**](CampaignsApi.md#campaignsByNameGet) | **GET** /campaigns/{name} | Load Campaign
[**campaignsByNamePausePut**](CampaignsApi.md#campaignsByNamePausePut) | **PUT** /campaigns/{name}/pause | Pause Campaign
[**campaignsByNamePut**](CampaignsApi.md#campaignsByNamePut) | **PUT** /campaigns/{name} | Update Campaign
[**campaignsGet**](CampaignsApi.md#campaignsGet) | **GET** /campaigns | Load Campaigns
[**campaignsPost**](CampaignsApi.md#campaignsPost) | **POST** /campaigns | Add Campaign



## campaignsByNameDelete

Delete Campaign

Delete the specific campaign.  This does not cancel in progress email, see Cancel In Progress. Required Access Level: ModifyCampaigns

### Example

```bash
ElasticEmail campaignsByNameDelete name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of Campaign to delete | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## campaignsByNameGet

Load Campaign

Returns the specified campaign details. Required Access Level: ViewCampaigns

### Example

```bash
ElasticEmail campaignsByNameGet name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of Campaign to get | [default to null]

### Return type

[**Campaign**](Campaign.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## campaignsByNamePausePut

Pause Campaign

Pauses the specific campaign, cancelling emails that are waiting to be sent. Required Access Level: ModifyCampaigns

### Example

```bash
ElasticEmail campaignsByNamePausePut name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of Campaign to pause | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## campaignsByNamePut

Update Campaign

Updates a previously added campaign.  Only Active and Paused campaigns can be updated. Required Access Level: ModifyCampaigns

### Example

```bash
ElasticEmail campaignsByNamePut name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of Campaign to update | [default to null]
 **campaign** | [**Campaign**](Campaign.md) | JSON representation of a campaign |

### Return type

[**Campaign**](Campaign.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## campaignsGet

Load Campaigns

Returns a list all of your campaigns. Limited to 1000 results. Required Access Level: ViewCampaigns

### Example

```bash
ElasticEmail campaignsGet  search=value  offset=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **string** | Text fragment used for searching in Campaign name (using the 'contains' rule) | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]

### Return type

[**array[Campaign]**](Campaign.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## campaignsPost

Add Campaign

Add a campaign for processing. Required Access Level: ModifyCampaigns

### Example

```bash
ElasticEmail campaignsPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **campaign** | [**Campaign**](Campaign.md) | JSON representation of a campaign |

### Return type

[**Campaign**](Campaign.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

