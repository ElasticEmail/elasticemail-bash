# VerificationsApi

All URIs are relative to */v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**verificationsByEmailDelete**](VerificationsApi.md#verificationsByEmailDelete) | **DELETE** /verifications/{email} | Delete Email Verification Result
[**verificationsByEmailGet**](VerificationsApi.md#verificationsByEmailGet) | **GET** /verifications/{email} | Get Email Verification Result
[**verificationsByEmailPost**](VerificationsApi.md#verificationsByEmailPost) | **POST** /verifications/{email} | Verify Email
[**verificationsFilesByIdDelete**](VerificationsApi.md#verificationsFilesByIdDelete) | **DELETE** /verifications/files/{id} | Delete File Verification Result
[**verificationsFilesByIdResultDownloadGet**](VerificationsApi.md#verificationsFilesByIdResultDownloadGet) | **GET** /verifications/files/{id}/result/download | Download File Verification Result
[**verificationsFilesByIdResultGet**](VerificationsApi.md#verificationsFilesByIdResultGet) | **GET** /verifications/files/{id}/result | Get Detailed File Verification Result
[**verificationsFilesByIdVerificationPost**](VerificationsApi.md#verificationsFilesByIdVerificationPost) | **POST** /verifications/files/{id}/verification | Start verification
[**verificationsFilesPost**](VerificationsApi.md#verificationsFilesPost) | **POST** /verifications/files | Upload File with Emails
[**verificationsFilesResultGet**](VerificationsApi.md#verificationsFilesResultGet) | **GET** /verifications/files/result | Get Files Verification Results
[**verificationsGet**](VerificationsApi.md#verificationsGet) | **GET** /verifications | Get Emails Verification Results



## verificationsByEmailDelete

Delete Email Verification Result

Delete a result with given email if exists. Required Access Level: VerifyEmails

### Example

```bash
ElasticEmail verificationsByEmailDelete email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Email address to verification | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verificationsByEmailGet

Get Email Verification Result

Returns a result of verified email. Required Access Level: ViewEmailVerifications

### Example

```bash
ElasticEmail verificationsByEmailGet email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Email address to view verification result of | [default to null]

### Return type

[**EmailValidationResult**](EmailValidationResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verificationsByEmailPost

Verify Email

Verify single email address and returns result of verification. Required Access Level: VerifyEmails

### Example

```bash
ElasticEmail verificationsByEmailPost email=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string** | Email address to verify | [default to null]

### Return type

[**EmailValidationResult**](EmailValidationResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verificationsFilesByIdDelete

Delete File Verification Result

Delete Verification Results if they exist. Required Access Level: VerifyEmails

### Example

```bash
ElasticEmail verificationsFilesByIdDelete id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the exported file | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verificationsFilesByIdResultDownloadGet

Download File Verification Result

Download verification results as a ZIP file. Required Access Level: VerifyEmails

### Example

```bash
ElasticEmail verificationsFilesByIdResultDownloadGet id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Verification ID to download | [default to null]

### Return type

**binary**

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verificationsFilesByIdResultGet

Get Detailed File Verification Result

Returns status and results (if verified) of file with given ID. Required Access Level: ViewEmailVerifications

### Example

```bash
ElasticEmail verificationsFilesByIdResultGet id=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the Verification to display status of | [default to null]
 **limit** | **integer** | Maximum number of returned email verification results | [optional] [default to null]
 **offset** | **integer** | How many result items should be returned ahead | [optional] [default to null]

### Return type

[**VerificationFileResultDetails**](VerificationFileResultDetails.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verificationsFilesByIdVerificationPost

Start verification

Start a verification of the previously uploaded file with emails. Required Access Level: VerifyEmails

### Example

```bash
ElasticEmail verificationsFilesByIdVerificationPost id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | File ID to start verification | [default to null]

### Return type

(empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: Not Applicable

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verificationsFilesPost

Upload File with Emails

Uploads a CSV file with list of emails that can then be triggered for verification. An 'email' column is required. Required Access Level: VerifyEmails

### Example

```bash
ElasticEmail verificationsFilesPost
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **binary** |  | [optional] [default to null]

### Return type

[**VerificationFileResult**](VerificationFileResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verificationsFilesResultGet

Get Files Verification Results

Returns a list of uploaded files, their statuses and results. Required Access Level: ViewEmailVerifications

### Example

```bash
ElasticEmail verificationsFilesResultGet
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**array[VerificationFileResult]**](VerificationFileResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verificationsGet

Get Emails Verification Results

Returns a results of all verified single emails. Required Access Level: ViewEmailVerifications

### Example

```bash
ElasticEmail verificationsGet  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer** | Maximum number of returned items. | [optional] [default to null]
 **offset** | **integer** | How many items should be returned ahead. | [optional] [default to null]

### Return type

[**array[EmailValidationResult]**](EmailValidationResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

