# SubAccountsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**subaccountsByEmailCreditsPatch**](SubAccountsApi.md#subaccountsByEmailCreditsPatch) | **PATCH** /subaccounts/{email}/credits | Add, Subtract Email Credits
[**subaccountsByEmailDelete**](SubAccountsApi.md#subaccountsByEmailDelete) | **DELETE** /subaccounts/{email} | Delete SubAccount
[**subaccountsByEmailGet**](SubAccountsApi.md#subaccountsByEmailGet) | **GET** /subaccounts/{email} | Load SubAccount
[**subaccountsByEmailSettingsEmailPut**](SubAccountsApi.md#subaccountsByEmailSettingsEmailPut) | **PUT** /subaccounts/{email}/settings/email | Update SubAccount Email Settings
[**subaccountsGet**](SubAccountsApi.md#subaccountsGet) | **GET** /subaccounts | Load SubAccounts
[**subaccountsPost**](SubAccountsApi.md#subaccountsPost) | **POST** /subaccounts | Add SubAccount



## subaccountsByEmailCreditsPatch

Add, Subtract Email Credits

Update email credits of a subaccount by the given amount. Required Access Level: ModifySubAccounts

### Example

```bash
ElasticEmail subaccountsByEmailCreditsPatch email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Email address of Sub-Account | [default to null]
 **subaccountEmailCreditsPayload** | [**SubaccountEmailCreditsPayload**](SubaccountEmailCreditsPayload.md) | Amount of email credits to add or subtract from the current SubAccount email credits pool (positive or negative value) |

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## subaccountsByEmailDelete

Delete SubAccount

Deletes specified SubAccount. An email will be sent to confirm this change. Required Access Level: ModifySubAccounts

### Example

```bash
ElasticEmail subaccountsByEmailDelete email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Email address of Sub-Account | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## subaccountsByEmailGet

Load SubAccount

Returns details for the specified SubAccount. Required Access Level: ViewSubAccounts

### Example

```bash
ElasticEmail subaccountsByEmailGet email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Email address of Sub-Account | [default to null]

### Return type

[**SubAccountInfo**](SubAccountInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## subaccountsByEmailSettingsEmailPut

Update SubAccount Email Settings

Update SubAccount email settings. Required Access Level: ModifySubAccounts

### Example

```bash
ElasticEmail subaccountsByEmailSettingsEmailPut email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** |  | [default to null]
 **subaccountEmailSettings** | [**SubaccountEmailSettings**](SubaccountEmailSettings.md) | Updated Email Settings |

### Return type

[**SubaccountEmailSettings**](SubaccountEmailSettings.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## subaccountsGet

Load SubAccounts

Returns a list of all your SubAccounts. Required Access Level: ViewSubAccounts

### Example

```bash
ElasticEmail subaccountsGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[SubAccountInfo]**](SubAccountInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## subaccountsPost

Add SubAccount

Add a new SubAccount to your Account. To receive an access token for this SubAccount, make a POST security/apikeys request using the 'subaccount' parameter. Required Access Level: ModifySubAccounts

### Example

```bash
ElasticEmail subaccountsPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subaccountPayload** | [**SubaccountPayload**](SubaccountPayload.md) |  |

### Return type

[**SubAccountInfo**](SubAccountInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

