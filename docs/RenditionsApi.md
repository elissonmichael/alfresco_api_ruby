# AlfrescoAPI::RenditionsApi

All URIs are relative to *https://localhost/alfresco/api/-default-/public/alfresco/versions/1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_rendition**](RenditionsApi.md#create_rendition) | **POST** /nodes/{nodeId}/renditions | Create rendition
[**get_rendition**](RenditionsApi.md#get_rendition) | **GET** /nodes/{nodeId}/renditions/{renditionId} | Get rendition information
[**get_rendition_content**](RenditionsApi.md#get_rendition_content) | **GET** /nodes/{nodeId}/renditions/{renditionId}/content | Get rendition content
[**list_renditions**](RenditionsApi.md#list_renditions) | **GET** /nodes/{nodeId}/renditions | List renditions


# **create_rendition**
> create_rendition(node_idrendition_body_create)

Create rendition

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  An asynchronous request to create a rendition for file **nodeId**.  The rendition is specified by name **id** in the request body: ```JSON {   \"id\":\"doclib\" } ``` 

### Example
```ruby
# load the gem
require 'alfresco_api'
# setup authorization
AlfrescoAPI.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = AlfrescoAPI::RenditionsApi.new

node_id = "node_id_example" # String | The identifier of a node.

rendition_body_create = AlfrescoAPI::RenditionBodyCreate.new # RenditionBodyCreate | The rendition \"id\".


begin
  #Create rendition
  api_instance.create_rendition(node_idrendition_body_create)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling RenditionsApi->create_rendition: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **rendition_body_create** | [**RenditionBodyCreate**](RenditionBodyCreate.md)| The rendition \&quot;id\&quot;. | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_rendition**
> RenditionEntry get_rendition(node_idrendition_id)

Get rendition information

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the rendition information for **renditionId** of file **nodeId**. 

### Example
```ruby
# load the gem
require 'alfresco_api'
# setup authorization
AlfrescoAPI.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = AlfrescoAPI::RenditionsApi.new

node_id = "node_id_example" # String | The identifier of a node.

rendition_id = "rendition_id_example" # String | The name of a thumbnail rendition, for example *doclib*, or *pdf*.


begin
  #Get rendition information
  result = api_instance.get_rendition(node_idrendition_id)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling RenditionsApi->get_rendition: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **rendition_id** | **String**| The name of a thumbnail rendition, for example *doclib*, or *pdf*. | 

### Return type

[**RenditionEntry**](RenditionEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_rendition_content**
> get_rendition_content(node_idrendition_id, opts)

Get rendition content

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the rendition content for **renditionId** of file **nodeId**. 

### Example
```ruby
# load the gem
require 'alfresco_api'
# setup authorization
AlfrescoAPI.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = AlfrescoAPI::RenditionsApi.new

node_id = "node_id_example" # String | The identifier of a node.

rendition_id = "rendition_id_example" # String | The name of a thumbnail rendition, for example *doclib*, or *pdf*.

opts = { 
  attachment: true, # BOOLEAN | **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
  if_modified_since: DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
  placeholder: false # BOOLEAN | If **true** and there is no rendition for this **nodeId** and **renditionId**,  then the placeholder image for the mime type of this rendition is returned, rather  than a 404 response. 
}

begin
  #Get rendition content
  api_instance.get_rendition_content(node_idrendition_id, opts)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling RenditionsApi->get_rendition_content: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **rendition_id** | **String**| The name of a thumbnail rendition, for example *doclib*, or *pdf*. | 
 **attachment** | **BOOLEAN**| **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response.  | [optional] [default to true]
 **if_modified_since** | **DateTime**| Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, &#x60;Wed, 09 Mar 2016 16:56:34 GMT&#x60;.  | [optional] 
 **placeholder** | **BOOLEAN**| If **true** and there is no rendition for this **nodeId** and **renditionId**,  then the placeholder image for the mime type of this rendition is returned, rather  than a 404 response.  | [optional] [default to false]

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_renditions**
> RenditionPaging list_renditions(node_id, opts)

List renditions

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets a list of the rendition information for each rendition of the the file **nodeId**, including the rendition id.  Each rendition returned has a **status**: CREATED means it is available to view or download, NOT_CREATED means the rendition can be requested.  You can use the **where** parameter to filter the returned renditions by **status**. For example, the following **where**  clause will return just the CREATED renditions:    ``` (status='CREATED') ``` 

### Example
```ruby
# load the gem
require 'alfresco_api'
# setup authorization
AlfrescoAPI.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = AlfrescoAPI::RenditionsApi.new

node_id = "node_id_example" # String | The identifier of a node.

opts = { 
  where: "where_example", # String | A string to restrict the returned objects by using a predicate.
}

begin
  #List renditions
  result = api_instance.list_renditions(node_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling RenditionsApi->list_renditions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **where** | **String**| A string to restrict the returned objects by using a predicate. | [optional] 

### Return type

[**RenditionPaging**](RenditionPaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



