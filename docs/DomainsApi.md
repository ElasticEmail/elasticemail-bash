# DomainsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**domainsByDomainDelete**](DomainsApi.md#domainsByDomainDelete) | **DELETE** /domains/{domain} | Delete Domain
[**domainsByDomainGet**](DomainsApi.md#domainsByDomainGet) | **GET** /domains/{domain} | Load Domain
[**domainsByDomainPut**](DomainsApi.md#domainsByDomainPut) | **PUT** /domains/{domain} | Update Domain
[**domainsByDomainRestrictedGet**](DomainsApi.md#domainsByDomainRestrictedGet) | **GET** /domains/{domain}/restricted | Check for domain restriction
[**domainsByDomainVerificationPut**](DomainsApi.md#domainsByDomainVerificationPut) | **PUT** /domains/{domain}/verification | Verify Domain
[**domainsByEmailDefaultPatch**](DomainsApi.md#domainsByEmailDefaultPatch) | **PATCH** /domains/{email}/default | Set Default
[**domainsGet**](DomainsApi.md#domainsGet) | **GET** /domains | Load Domains
[**domainsPost**](DomainsApi.md#domainsPost) | **POST** /domains | Add Domain



## domainsByDomainDelete

Delete Domain

Deletes configured domain from Account. Required Access Level: ModifySettings

### Example

```bash
ElasticEmail domainsByDomainDelete domain=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string** | Name of the given domain | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## domainsByDomainGet

Load Domain

Retrieve a domain configured for this Account. Required Access Level: ViewSettings

### Example

```bash
ElasticEmail domainsByDomainGet domain=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string** | Name of the given domain | [default to null]

### Return type

[**DomainData**](DomainData.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## domainsByDomainPut

Update Domain

Updates the specified domain. Required Access Level: ModifySettings

### Example

```bash
ElasticEmail domainsByDomainPut domain=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string** | Name of the given domain | [default to null]
 **domainUpdatePayload** | [**DomainUpdatePayload**](DomainUpdatePayload.md) | Updated Domain resource |

### Return type

[**DomainDetail**](DomainDetail.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## domainsByDomainRestrictedGet

Check for domain restriction

Checking if domain is from free provider, or restricted. Required Access Level: ViewSettings

### Example

```bash
ElasticEmail domainsByDomainRestrictedGet domain=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string** | Name of the given domain | [default to null]

### Return type

**boolean**

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## domainsByDomainVerificationPut

Verify Domain

Verifies that required DNS records exist for specified domain. Required Access Level: ModifySettings

### Example

```bash
ElasticEmail domainsByDomainVerificationPut domain=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string** | Name of the given domain | [default to null]
 **body** | **string** | Tracking type used in the Tracking verification |

### Return type

[**DomainData**](DomainData.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## domainsByEmailDefaultPatch

Set Default

Sets a verified email address as default sender. Required Access Level: ModifySettings

### Example

```bash
ElasticEmail domainsByEmailDefaultPatch email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Default email sender, example: mail@yourdomain.com | [default to null]

### Return type

[**DomainDetail**](DomainDetail.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## domainsGet

Load Domains

Returns a list of all domains configured for this Account. Required Access Level: ViewSettings

### Example

```bash
ElasticEmail domainsGet
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**array[DomainDetail]**](DomainDetail.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## domainsPost

Add Domain

Add new domain to Account. Required Access Level: ModifySettings

### Example

```bash
ElasticEmail domainsPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domainPayload** | [**DomainPayload**](DomainPayload.md) | Domain to add |

### Return type

[**DomainDetail**](DomainDetail.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

