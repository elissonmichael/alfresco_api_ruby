# AlfrescoAPI::TrashcanApi

All URIs are relative to *https://localhost/alfresco/api/-default-/public/alfresco/versions/1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_deleted_node**](TrashcanApi.md#delete_deleted_node) | **DELETE** /deleted-nodes/{nodeId} | Permanently delete a deleted node
[**get_archived_node_rendition**](TrashcanApi.md#get_archived_node_rendition) | **GET** /deleted-nodes/{nodeId}/renditions/{renditionId} | Get rendition information for a deleted node
[**get_archived_node_rendition_content**](TrashcanApi.md#get_archived_node_rendition_content) | **GET** /deleted-nodes/{nodeId}/renditions/{renditionId}/content | Get rendition content of a deleted node
[**get_deleted_node**](TrashcanApi.md#get_deleted_node) | **GET** /deleted-nodes/{nodeId} | Get a deleted node
[**get_deleted_node_content**](TrashcanApi.md#get_deleted_node_content) | **GET** /deleted-nodes/{nodeId}/content | Get deleted node content
[**list_deleted_node_renditions**](TrashcanApi.md#list_deleted_node_renditions) | **GET** /deleted-nodes/{nodeId}/renditions | List renditions for a deleted node
[**list_deleted_nodes**](TrashcanApi.md#list_deleted_nodes) | **GET** /deleted-nodes | List deleted nodes
[**restore_deleted_node**](TrashcanApi.md#restore_deleted_node) | **POST** /deleted-nodes/{nodeId}/restore | Restore a deleted node


# **delete_deleted_node**
> delete_deleted_node(node_id)

Permanently delete a deleted node

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Permanently deletes the deleted node **nodeId**. 

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

api_instance = AlfrescoAPI::TrashcanApi.new

node_id = "node_id_example" # String | The identifier of a node.


begin
  #Permanently delete a deleted node
  api_instance.delete_deleted_node(node_id)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling TrashcanApi->delete_deleted_node: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_archived_node_rendition**
> RenditionEntry get_archived_node_rendition(node_idrendition_id)

Get rendition information for a deleted node

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

api_instance = AlfrescoAPI::TrashcanApi.new

node_id = "node_id_example" # String | The identifier of a node.

rendition_id = "rendition_id_example" # String | The name of a thumbnail rendition, for example *doclib*, or *pdf*.


begin
  #Get rendition information for a deleted node
  result = api_instance.get_archived_node_rendition(node_idrendition_id)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling TrashcanApi->get_archived_node_rendition: #{e}"
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



# **get_archived_node_rendition_content**
> get_archived_node_rendition_content(node_idrendition_id, opts)

Get rendition content of a deleted node

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

api_instance = AlfrescoAPI::TrashcanApi.new

node_id = "node_id_example" # String | The identifier of a node.

rendition_id = "rendition_id_example" # String | The name of a thumbnail rendition, for example *doclib*, or *pdf*.

opts = { 
  attachment: true, # BOOLEAN | **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
  if_modified_since: DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
  placeholder: false # BOOLEAN | If **true** and there is no rendition for this **nodeId** and **renditionId**, then the placeholder image for the mime type of this rendition is returned, rather than a 404 response. 
}

begin
  #Get rendition content of a deleted node
  api_instance.get_archived_node_rendition_content(node_idrendition_id, opts)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling TrashcanApi->get_archived_node_rendition_content: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **rendition_id** | **String**| The name of a thumbnail rendition, for example *doclib*, or *pdf*. | 
 **attachment** | **BOOLEAN**| **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response.  | [optional] [default to true]
 **if_modified_since** | **DateTime**| Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, &#x60;Wed, 09 Mar 2016 16:56:34 GMT&#x60;.  | [optional] 
 **placeholder** | **BOOLEAN**| If **true** and there is no rendition for this **nodeId** and **renditionId**, then the placeholder image for the mime type of this rendition is returned, rather than a 404 response.  | [optional] [default to false]

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_deleted_node**
> DeletedNodeEntry get_deleted_node(node_id, opts)

Get a deleted node

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the specific deleted node **nodeId**. 

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

api_instance = AlfrescoAPI::TrashcanApi.new

node_id = "node_id_example" # String | The identifier of a node.

opts = { 
  include: ["include_example"] # Array<String> | Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isLocked * path * permissions 
}

begin
  #Get a deleted node
  result = api_instance.get_deleted_node(node_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling TrashcanApi->get_deleted_node: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **include** | [**Array&lt;String&gt;**](String.md)| Returns additional information about the node. The following optional fields can be requested: * allowableOperations * association * isLink * isLocked * path * permissions  | [optional] 

### Return type

[**DeletedNodeEntry**](DeletedNodeEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_deleted_node_content**
> get_deleted_node_content(node_id, opts)

Get deleted node content

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the content of the deleted node with identifier **nodeId**. 

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

api_instance = AlfrescoAPI::TrashcanApi.new

node_id = "node_id_example" # String | The identifier of a node.

opts = { 
  attachment: true, # BOOLEAN | **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
  if_modified_since: DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
}

begin
  #Get deleted node content
  api_instance.get_deleted_node_content(node_id, opts)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling TrashcanApi->get_deleted_node_content: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **attachment** | **BOOLEAN**| **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response.  | [optional] [default to true]
 **if_modified_since** | **DateTime**| Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, &#x60;Wed, 09 Mar 2016 16:56:34 GMT&#x60;.  | [optional] 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_deleted_node_renditions**
> RenditionPaging list_deleted_node_renditions(node_id, opts)

List renditions for a deleted node

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets a list of the rendition information for each rendition of the file **nodeId**, including the rendition id.  Each rendition returned has a **status**: CREATED means it is available to view or download, NOT_CREATED means the rendition can be requested.  You can use the **where** parameter to filter the returned renditions by **status**. For example, the following **where** clause will return just the CREATED renditions:  ``` (status='CREATED') ``` 

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

api_instance = AlfrescoAPI::TrashcanApi.new

node_id = "node_id_example" # String | The identifier of a node.

opts = { 
  where: "where_example", # String | A string to restrict the returned objects by using a predicate.
}

begin
  #List renditions for a deleted node
  result = api_instance.list_deleted_node_renditions(node_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling TrashcanApi->list_deleted_node_renditions: #{e}"
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



# **list_deleted_nodes**
> DeletedNodesPaging list_deleted_nodes(opts)

List deleted nodes

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets a list of deleted nodes for the current user.  If the current user is an administrator deleted nodes for all users will be returned.  The list of deleted nodes will be ordered with the most recently deleted node at the top of the list. 

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

api_instance = AlfrescoAPI::TrashcanApi.new

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  include: ["include_example"] # Array<String> | Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * association * isLink * isLocked * path * properties * permissions 
}

begin
  #List deleted nodes
  result = api_instance.list_deleted_nodes(opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling TrashcanApi->list_deleted_nodes: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]
 **include** | [**Array&lt;String&gt;**](String.md)| Returns additional information about the node. The following optional fields can be requested: * allowableOperations * aspectNames * association * isLink * isLocked * path * properties * permissions  | [optional] 

### Return type

[**DeletedNodesPaging**](DeletedNodesPaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **restore_deleted_node**
> NodeEntry restore_deleted_node(node_id, opts)

Restore a deleted node

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Attempts to restore the deleted node **nodeId** to its original location.  If the node is successfully restored to its former primary parent, then only the  primary child association will be restored, including recursively for any primary  children. It should be noted that no other secondary child associations or peer  associations will be restored, for any of the nodes within the primary parent-child  hierarchy of restored nodes, irrespective of whether these associations were to  nodes within or outside of the restored hierarchy.   Also, any previously shared link will not be restored since it is deleted at the time  of delete of each node. 

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

api_instance = AlfrescoAPI::TrashcanApi.new

node_id = "node_id_example" # String | The identifier of a node.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Restore a deleted node
  result = api_instance.restore_deleted_node(node_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling TrashcanApi->restore_deleted_node: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**NodeEntry**](NodeEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



