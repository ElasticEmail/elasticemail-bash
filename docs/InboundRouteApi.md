# InboundRouteApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**inboundrouteByIdDelete**](InboundRouteApi.md#inboundrouteByIdDelete) | **DELETE** /inboundroute/{id} | Delete Route
[**inboundrouteByIdGet**](InboundRouteApi.md#inboundrouteByIdGet) | **GET** /inboundroute/{id} | Get Route
[**inboundrouteByIdPut**](InboundRouteApi.md#inboundrouteByIdPut) | **PUT** /inboundroute/{id} | Update Route
[**inboundrouteGet**](InboundRouteApi.md#inboundrouteGet) | **GET** /inboundroute | Get Routes
[**inboundrouteOrderPut**](InboundRouteApi.md#inboundrouteOrderPut) | **PUT** /inboundroute/order | Update Sorting
[**inboundroutePost**](InboundRouteApi.md#inboundroutePost) | **POST** /inboundroute | Create Route



## inboundrouteByIdDelete

Delete Route

Deletes the Inbound Route. Required Access Level: ModifySettings

### Example

```bash
ElasticEmail inboundrouteByIdDelete id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## inboundrouteByIdGet

Get Route

Load an Inbound Route. Required Access Level: ViewSettings

### Example

```bash
ElasticEmail inboundrouteByIdGet id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID number of your attachment | [default to null]

### Return type

[**InboundRoute**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## inboundrouteByIdPut

Update Route

Update the Inbound Route. Required Access Level: ModifySettings

### Example

```bash
ElasticEmail inboundrouteByIdPut id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **inboundPayload** | [**InboundPayload**](InboundPayload.md) |  |

### Return type

[**InboundRoute**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## inboundrouteGet

Get Routes

Get all your Inbound Routes. Required Access Level: ViewSettings

### Example

```bash
ElasticEmail inboundrouteGet
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**array[InboundRoute]**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## inboundrouteOrderPut

Update Sorting

Required Access Level: ViewSettings

### Example

```bash
ElasticEmail inboundrouteOrderPut
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sortOrderItem** | [**array[SortOrderItem]**](SortOrderItem.md) | Change the ordering of inbound routes for when matching the inbound |

### Return type

[**array[InboundRoute]**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## inboundroutePost

Create Route

Create new Inbound Route. Required Access Level: ModifySettings

### Example

```bash
ElasticEmail inboundroutePost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inboundPayload** | [**InboundPayload**](InboundPayload.md) |  |

### Return type

[**InboundRoute**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

