# AlfrescoAPI::CommentsApi

All URIs are relative to *https://localhost/alfresco/api/-default-/public/alfresco/versions/1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_comment**](CommentsApi.md#create_comment) | **POST** /nodes/{nodeId}/comments | Create a comment
[**delete_comment**](CommentsApi.md#delete_comment) | **DELETE** /nodes/{nodeId}/comments/{commentId} | Delete a comment
[**list_comments**](CommentsApi.md#list_comments) | **GET** /nodes/{nodeId}/comments | List comments
[**update_comment**](CommentsApi.md#update_comment) | **PUT** /nodes/{nodeId}/comments/{commentId} | Update a comment


# **create_comment**
> CommentEntry create_comment(node_idcomment_body_create, opts)

Create a comment

Creates a comment on node **nodeId**. You specify the comment in a JSON body like this:  ```JSON {   \"content\": \"This is a comment\" } ```  **Note:** You can create more than one comment by  specifying a list of comments in the JSON body like this:  ```JSON [   {     \"content\": \"This is a comment\"   },   {     \"content\": \"This is another comment\"   } ] ``` If you specify a list as input, then a paginated list rather than an entry is returned in the response body. For example:  ```JSON {   \"list\": {     \"pagination\": {       \"count\": 2,       \"hasMoreItems\": false,       \"totalItems\": 2,       \"skipCount\": 0,       \"maxItems\": 100     },     \"entries\": [       {         \"entry\": {           ...         }       },       {         \"entry\": {           ...         }       }     ]   } } ``` 

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

api_instance = AlfrescoAPI::CommentsApi.new

node_id = "node_id_example" # String | The identifier of a node.

comment_body_create = AlfrescoAPI::CommentBody.new # CommentBody | The comment text. Note that you can also provide a list of comments.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Create a comment
  result = api_instance.create_comment(node_idcomment_body_create, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling CommentsApi->create_comment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **comment_body_create** | [**CommentBody**](CommentBody.md)| The comment text. Note that you can also provide a list of comments. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**CommentEntry**](CommentEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_comment**
> delete_comment(node_idcomment_id)

Delete a comment

Deletes the comment **commentId** from node **nodeId**.

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

api_instance = AlfrescoAPI::CommentsApi.new

node_id = "node_id_example" # String | The identifier of a node.

comment_id = "comment_id_example" # String | The identifier of a comment.


begin
  #Delete a comment
  api_instance.delete_comment(node_idcomment_id)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling CommentsApi->delete_comment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **comment_id** | **String**| The identifier of a comment. | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_comments**
> CommentPaging list_comments(node_id, opts)

List comments

Gets a list of comments for the node **nodeId**, sorted chronologically with the newest comment first.

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

api_instance = AlfrescoAPI::CommentsApi.new

node_id = "node_id_example" # String | The identifier of a node.

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #List comments
  result = api_instance.list_comments(node_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling CommentsApi->list_comments: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**CommentPaging**](CommentPaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_comment**
> CommentEntry update_comment(node_idcomment_idcomment_body_update, opts)

Update a comment

Updates an existing comment **commentId** on node **nodeId**.

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

api_instance = AlfrescoAPI::CommentsApi.new

node_id = "node_id_example" # String | The identifier of a node.

comment_id = "comment_id_example" # String | The identifier of a comment.

comment_body_update = AlfrescoAPI::CommentBody.new # CommentBody | The JSON representing the comment to be updated.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Update a comment
  result = api_instance.update_comment(node_idcomment_idcomment_body_update, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling CommentsApi->update_comment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **node_id** | **String**| The identifier of a node. | 
 **comment_id** | **String**| The identifier of a comment. | 
 **comment_body_update** | [**CommentBody**](CommentBody.md)| The JSON representing the comment to be updated. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**CommentEntry**](CommentEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



