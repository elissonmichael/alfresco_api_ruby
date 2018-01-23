# AlfrescoAPI::VersionsApi

All URIs are relative to *https://localhost/alfresco/api/-default-/public/alfresco/versions/1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_version**](VersionsApi.md#delete_version) | **DELETE** /nodes/{nodeId}/versions/{versionId} | Delete a version
[**get_version**](VersionsApi.md#get_version) | **GET** /nodes/{nodeId}/versions/{versionId} | Get version information
[**get_version_content**](VersionsApi.md#get_version_content) | **GET** /nodes/{nodeId}/versions/{versionId}/content | Get version content
[**list_version_history**](VersionsApi.md#list_version_history) | **GET** /nodes/{nodeId}/versions | List version history
[**revert_version**](VersionsApi.md#revert_version) | **POST** /nodes/{nodeId}/versions/{versionId}/revert | Revert a version


# **delete_version**
> delete_version(node_idversion_id, )

Delete a version

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Delete the version identified by **versionId** and **nodeId*.  If the version is successfully deleted then the content and metadata for that versioned node will be deleted and will no longer appear in the version history. This operation cannot be undone.  If the most recent version is deleted the live node will revert to the next most recent version.  We currently do not allow the last version to be deleted. If you wish to clear the history then you can remove the \"cm:versionable\" aspect (via update node) which will also disable versioning. In this case, you can re-enable versioning by adding back the \"cm:versionable\" aspect or using the version  params (majorVersion and comment) on a subsequent file content update. 

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

api_instance = AlfrescoAPI::VersionsApi.new

node_id = "node_id_example" # String | The identifier of a node.

version_id = "version_id_example" # String | The identifier of a version, ie. version label, within the version history of a node.


begin
  #Delete a version
  api_instance.delete_version(node_idversion_id, )
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling VersionsApi->delete_version: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **version_id** | **String**| The identifier of a version, ie. version label, within the version history of a node. | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_version**
> VersionEntry get_version(node_idversion_id, )

Get version information

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the version information for **versionId** of file node **nodeId**. 

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

api_instance = AlfrescoAPI::VersionsApi.new

node_id = "node_id_example" # String | The identifier of a node.

version_id = "version_id_example" # String | The identifier of a version, ie. version label, within the version history of a node.


begin
  #Get version information
  result = api_instance.get_version(node_idversion_id, )
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling VersionsApi->get_version: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **version_id** | **String**| The identifier of a version, ie. version label, within the version history of a node. | 

### Return type

[**VersionEntry**](VersionEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_version_content**
> get_version_content(node_idversion_id, , opts)

Get version content

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the version content for **versionId** of file node **nodeId**. 

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

api_instance = AlfrescoAPI::VersionsApi.new

node_id = "node_id_example" # String | The identifier of a node.

version_id = "version_id_example" # String | The identifier of a version, ie. version label, within the version history of a node.

opts = { 
  attachment: true, # BOOLEAN | **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
  if_modified_since: DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
}

begin
  #Get version content
  api_instance.get_version_content(node_idversion_id, , opts)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling VersionsApi->get_version_content: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **version_id** | **String**| The identifier of a version, ie. version label, within the version history of a node. | 
 **attachment** | **BOOLEAN**| **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response.  | [optional] [default to true]
 **if_modified_since** | **DateTime**| Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, &#x60;Wed, 09 Mar 2016 16:56:34 GMT&#x60;.  | [optional] 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_version_history**
> VersionPaging list_version_history(node_id, opts)

List version history

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the version history as an ordered list of versions for the specified **nodeId**.  The list is ordered in descending modified order. So the most recent version is first and  the original version is last in the list.  

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

api_instance = AlfrescoAPI::VersionsApi.new

node_id = "node_id_example" # String | The identifier of a node.

opts = { 
  include: ["include_example"], # Array<String> | Returns additional information about the version node. The following optional fields can be requested: * properties * aspectNames 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
}

begin
  #List version history
  result = api_instance.list_version_history(node_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling VersionsApi->list_version_history: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **include** | [**Array&lt;String&gt;**](String.md)| Returns additional information about the version node. The following optional fields can be requested: * properties * aspectNames  | [optional] 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]

### Return type

[**VersionPaging**](VersionPaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **revert_version**
> VersionEntry revert_version(node_idversion_id, revert_body, opts)

Revert a version

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Attempts to revert the version identified by **versionId** and **nodeId** to the live node.  If the node is successfully reverted then the content and metadata for that versioned node will be promoted to the live node and a new version will appear in the version history. 

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

api_instance = AlfrescoAPI::VersionsApi.new

node_id = "node_id_example" # String | The identifier of a node.

version_id = "version_id_example" # String | The identifier of a version, ie. version label, within the version history of a node.

revert_body = AlfrescoAPI::RevertBody.new # RevertBody | Optionally, specify a version comment and whether this should be a major version, or not.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Revert a version
  result = api_instance.revert_version(node_idversion_id, revert_body, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling VersionsApi->revert_version: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **version_id** | **String**| The identifier of a version, ie. version label, within the version history of a node. | 
 **revert_body** | [**RevertBody**](RevertBody.md)| Optionally, specify a version comment and whether this should be a major version, or not. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**VersionEntry**](VersionEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



