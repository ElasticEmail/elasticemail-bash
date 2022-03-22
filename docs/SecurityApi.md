# SecurityApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**securityApikeysByNameDelete**](SecurityApi.md#securityApikeysByNameDelete) | **DELETE** /security/apikeys/{name} | Delete ApiKey
[**securityApikeysByNameGet**](SecurityApi.md#securityApikeysByNameGet) | **GET** /security/apikeys/{name} | Load ApiKey
[**securityApikeysByNamePut**](SecurityApi.md#securityApikeysByNamePut) | **PUT** /security/apikeys/{name} | Update ApiKey
[**securityApikeysGet**](SecurityApi.md#securityApikeysGet) | **GET** /security/apikeys | List ApiKeys
[**securityApikeysPost**](SecurityApi.md#securityApikeysPost) | **POST** /security/apikeys | Add ApiKey
[**securitySmtpByNameDelete**](SecurityApi.md#securitySmtpByNameDelete) | **DELETE** /security/smtp/{name} | Delete SMTP Credential
[**securitySmtpByNameGet**](SecurityApi.md#securitySmtpByNameGet) | **GET** /security/smtp/{name} | Load SMTP Credential
[**securitySmtpByNamePut**](SecurityApi.md#securitySmtpByNamePut) | **PUT** /security/smtp/{name} | Update SMTP Credential
[**securitySmtpGet**](SecurityApi.md#securitySmtpGet) | **GET** /security/smtp | List SMTP Credentials
[**securitySmtpPost**](SecurityApi.md#securitySmtpPost) | **POST** /security/smtp | Add SMTP Credential



## securityApikeysByNameDelete

Delete ApiKey

Delete your existing ApiKey. Required Access Level: Security

### Example

```bash
ElasticEmail securityApikeysByNameDelete name=value  subaccount=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of the ApiKey | [default to null]
 **subaccount** | **string** | Email of the subaccount of which ApiKey should be deleted | [optional] [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## securityApikeysByNameGet

Load ApiKey

Load your existing ApiKey info. Required Access Level: Security

### Example

```bash
ElasticEmail securityApikeysByNameGet name=value  subaccount=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of the ApiKey | [default to null]
 **subaccount** | **string** | Email of the subaccount of which ApiKey should be loaded | [optional] [default to null]

### Return type

[**ApiKey**](ApiKey.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## securityApikeysByNamePut

Update ApiKey

Update your existing ApiKey. Required Access Level: Security

### Example

```bash
ElasticEmail securityApikeysByNamePut name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of the ApiKey | [default to null]
 **apiKeyPayload** | [**ApiKeyPayload**](ApiKeyPayload.md) |  |

### Return type

[**ApiKey**](ApiKey.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## securityApikeysGet

List ApiKeys

List all your existing ApiKeys. Required Access Level: Security

### Example

```bash
ElasticEmail securityApikeysGet  subaccount=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subaccount** | **string** | Email of the subaccount of which ApiKeys should be loaded | [optional] [default to null]

### Return type

[**array[ApiKey]**](ApiKey.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## securityApikeysPost

Add ApiKey

Add a new ApiKey. Required Access Level: Security

### Example

```bash
ElasticEmail securityApikeysPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **apiKeyPayload** | [**ApiKeyPayload**](ApiKeyPayload.md) |  |

### Return type

[**NewApiKey**](NewApiKey.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## securitySmtpByNameDelete

Delete SMTP Credential

Delete your existing SMTP Credentials. Required Access Level: Security

### Example

```bash
ElasticEmail securitySmtpByNameDelete name=value  subaccount=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of the SMTP Credential | [default to null]
 **subaccount** | **string** | Email of the subaccount of which credential should be deleted | [optional] [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## securitySmtpByNameGet

Load SMTP Credential

Load your existing SMTP Credential info. Required Access Level: Security

### Example

```bash
ElasticEmail securitySmtpByNameGet name=value  subaccount=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of the SMTP Credential | [default to null]
 **subaccount** | **string** | Email of the subaccount of which credential should be loaded | [optional] [default to null]

### Return type

[**SmtpCredentials**](SmtpCredentials.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## securitySmtpByNamePut

Update SMTP Credential

Update your existing SMTP Credentials. Required Access Level: Security

### Example

```bash
ElasticEmail securitySmtpByNamePut name=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string** | Name of the SMTP Credential | [default to null]
 **smtpCredentialsPayload** | [**SmtpCredentialsPayload**](SmtpCredentialsPayload.md) |  |

### Return type

[**SmtpCredentials**](SmtpCredentials.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## securitySmtpGet

List SMTP Credentials

List all your existing SMTP Credentials. Required Access Level: Security

### Example

```bash
ElasticEmail securitySmtpGet  subaccount=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subaccount** | **string** | Email of the subaccount of which credentials should be listed | [optional] [default to null]

### Return type

[**array[SmtpCredentials]**](SmtpCredentials.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## securitySmtpPost

Add SMTP Credential

Add new SMTP Credential. Required Access Level: Security

### Example

```bash
ElasticEmail securitySmtpPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **smtpCredentialsPayload** | [**SmtpCredentialsPayload**](SmtpCredentialsPayload.md) |  |

### Return type

[**NewSmtpCredentials**](NewSmtpCredentials.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

