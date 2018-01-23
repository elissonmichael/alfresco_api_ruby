# AlfrescoAPI::PeopleApi

All URIs are relative to *https://localhost/alfresco/api/-default-/public/alfresco/versions/1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_person**](PeopleApi.md#create_person) | **POST** /people | Create person
[**delete_avatar_image**](PeopleApi.md#delete_avatar_image) | **DELETE** /people/{personId}/avatar | Delete avatar image
[**get_avatar_image**](PeopleApi.md#get_avatar_image) | **GET** /people/{personId}/avatar | Get avatar image
[**get_person**](PeopleApi.md#get_person) | **GET** /people/{personId} | Get a person
[**list_people**](PeopleApi.md#list_people) | **GET** /people | List people
[**request_password_reset**](PeopleApi.md#request_password_reset) | **POST** /people/{personId}/request-password-reset | Request password reset
[**reset_password**](PeopleApi.md#reset_password) | **POST** /people/{personId}/reset-password | Reset password
[**update_avatar_image**](PeopleApi.md#update_avatar_image) | **PUT** /people/{personId}/avatar | Update avatar image
[**update_person**](PeopleApi.md#update_person) | **PUT** /people/{personId} | Update person


# **create_person**
> PersonEntry create_person(person_body_create, opts)

Create person

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Create a person.  If applicable, the given person's login access can also be optionally disabled.  You must have admin rights to create a person.  You can set custom properties when you create a person: ```JSON {   \"id\": \"abeecher\",   \"firstName\": \"Alice\",   \"lastName\": \"Beecher\",   \"email\": \"abeecher@example.com\",   \"password\": \"secret\",   \"properties\":   {     \"my:property\": \"The value\"   } } ``` **Note:** setting properties of type d:content and d:category are not supported. 

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

api_instance = AlfrescoAPI::PeopleApi.new

person_body_create = AlfrescoAPI::PersonBodyCreate.new # PersonBodyCreate | The person details.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Create person
  result = api_instance.create_person(person_body_create, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling PeopleApi->create_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_body_create** | [**PersonBodyCreate**](PersonBodyCreate.md)| The person details. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**PersonEntry**](PersonEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_avatar_image**
> delete_avatar_image(person_id)

Delete avatar image

**Note:** this endpoint is available in Alfresco 5.2.2 and newer versions.  Deletes the avatar image related to person **personId**.  You must be the person or have admin rights to update a person's avatar.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::PeopleApi.new

person_id = "person_id_example" # String | The identifier of a person.


begin
  #Delete avatar image
  api_instance.delete_avatar_image(person_id)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling PeopleApi->delete_avatar_image: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_avatar_image**
> get_avatar_image(person_id, opts)

Get avatar image

**Note:** this endpoint is available in Alfresco 5.2.2 and newer versions.  Gets the avatar image related to the person **personId**. If the person has no related avatar then  the **placeholder** query parameter can be optionally used to request a placeholder image to be returned.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::PeopleApi.new

person_id = "person_id_example" # String | The identifier of a person.

opts = { 
  attachment: true, # BOOLEAN | **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
  if_modified_since: DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, `Wed, 09 Mar 2016 16:56:34 GMT`. 
  placeholder: true # BOOLEAN | If **true** and there is no avatar for this **personId**  then the placeholder image is returned, rather than a 404 response. 
}

begin
  #Get avatar image
  api_instance.get_avatar_image(person_id, opts)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling PeopleApi->get_avatar_image: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **attachment** | **BOOLEAN**| **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response.  | [optional] [default to true]
 **if_modified_since** | **DateTime**| Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, &#x60;Wed, 09 Mar 2016 16:56:34 GMT&#x60;.  | [optional] 
 **placeholder** | **BOOLEAN**| If **true** and there is no avatar for this **personId**  then the placeholder image is returned, rather than a 404 response.  | [optional] [default to true]

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_person**
> PersonEntry get_person(person_id, opts)

Get a person

Gets information for the person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::PeopleApi.new

person_id = "person_id_example" # String | The identifier of a person.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Get a person
  result = api_instance.get_person(person_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling PeopleApi->get_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**PersonEntry**](PersonEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_people**
> PersonPaging list_people(opts)

List people

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  List people.  You can use the **include** parameter to return any additional information.  The default sort order for the returned list is for people to be sorted by ascending id. You can override the default by using the **orderBy** parameter.  You can use any of the following fields to order the results: * id * firstName * lastName 

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

api_instance = AlfrescoAPI::PeopleApi.new

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  order_by: ["order_by_example"], # Array<String> | A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
  include: ["include_example"], # Array<String> | Returns additional information about the person. The following optional fields can be requested: * properties * aspectNames 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #List people
  result = api_instance.list_people(opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling PeopleApi->list_people: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]
 **order_by** | [**Array&lt;String&gt;**](String.md)| A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field.  | [optional] 
 **include** | [**Array&lt;String&gt;**](String.md)| Returns additional information about the person. The following optional fields can be requested: * properties * aspectNames  | [optional] 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**PersonPaging**](PersonPaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **request_password_reset**
> request_password_reset(person_idclient_body)

Request password reset

**Note:** this endpoint is available in Alfresco 5.2.1 and newer versions.  Initiates the reset password workflow to send an email with reset password instruction to the user's registered email.  The client is mandatory in the request body. For example: ```JSON {   \"client\": \"myClient\" } ``` **Note:** The client must be registered before this API can send an email. See [server documentation]. However, out-of-the-box share is registered as a default client, so you could pass **share** as the client name: ```JSON {   \"client\": \"share\" } ``` **Note:** No authentication is required to call this endpoint. 

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

api_instance = AlfrescoAPI::PeopleApi.new

person_id = "person_id_example" # String | The identifier of a person.

client_body = AlfrescoAPI::ClientBody.new # ClientBody | The client name to send email with app-specific url.


begin
  #Request password reset
  api_instance.request_password_reset(person_idclient_body)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling PeopleApi->request_password_reset: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **client_body** | [**ClientBody**](ClientBody.md)| The client name to send email with app-specific url. | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **reset_password**
> reset_password(person_idpassword_reset_body)

Reset password

**Note:** this endpoint is available in Alfresco 5.2.1 and newer versions.  Resets user's password  The password, id and key properties are mandatory in the request body. For example: ```JSON {   \"password\":\"newPassword\",   \"id\":\"activiti$10\",   \"key\":\"4dad6d00-0daf-413a-b200-f64af4e12345\" } ``` **Note:** No authentication is required to call this endpoint. 

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

api_instance = AlfrescoAPI::PeopleApi.new

person_id = "person_id_example" # String | The identifier of a person.

password_reset_body = AlfrescoAPI::PasswordResetBody.new # PasswordResetBody | The reset password details


begin
  #Reset password
  api_instance.reset_password(person_idpassword_reset_body)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling PeopleApi->reset_password: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **password_reset_body** | [**PasswordResetBody**](PasswordResetBody.md)| The reset password details | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_avatar_image**
> update_avatar_image(person_idcontent_body_update)

Update avatar image

**Note:** this endpoint is available in Alfresco 5.2.2 and newer versions.  Updates the avatar image related to the person **personId**.  The request body should be the binary stream for the avatar image. The content type of the file  should be an image file. This will be used to generate an \"avatar\" thumbnail rendition.  You must be the person or have admin rights to update a person's avatar.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::PeopleApi.new

person_id = "person_id_example" # String | The identifier of a person.

content_body_update = "B" # String | The binary content


begin
  #Update avatar image
  api_instance.update_avatar_image(person_idcontent_body_update)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling PeopleApi->update_avatar_image: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **content_body_update** | **String**| The binary content | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/octet-stream
 - **Accept**: application/json



# **update_person**
> PersonEntry update_person(person_idperson_body_update, opts)

Update person

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Update the given person's details.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user.  If applicable, the given person's login access can also be optionally disabled or re-enabled.  You must have admin rights to update a person — unless updating your own details.  If you are changing your password, as a non-admin user, then the existing password must also be supplied (using the oldPassword field in addition to the new password value).  Admin users cannot be disabled by setting enabled to false.  Non-admin users may not disable themselves.  You can set custom properties when you update a person: ```JSON {   \"firstName\": \"Alice\",   \"properties\":   {     \"my:property\": \"The value\"   } } ``` **Note:** setting properties of type d:content and d:category are not supported. 

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

api_instance = AlfrescoAPI::PeopleApi.new

person_id = "person_id_example" # String | The identifier of a person.

person_body_update = AlfrescoAPI::PersonBodyUpdate.new # PersonBodyUpdate | The person details.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Update person
  result = api_instance.update_person(person_idperson_body_update, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling PeopleApi->update_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **person_body_update** | [**PersonBodyUpdate**](PersonBodyUpdate.md)| The person details. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**PersonEntry**](PersonEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



