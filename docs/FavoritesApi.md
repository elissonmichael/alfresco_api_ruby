# AlfrescoAPI::FavoritesApi

All URIs are relative to *https://localhost/alfresco/api/-default-/public/alfresco/versions/1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_favorite**](FavoritesApi.md#create_favorite) | **POST** /people/{personId}/favorites | Create a favorite
[**create_site_favorite**](FavoritesApi.md#create_site_favorite) | **POST** /people/{personId}/favorite-sites | Create a site favorite
[**delete_favorite**](FavoritesApi.md#delete_favorite) | **DELETE** /people/{personId}/favorites/{favoriteId} | Delete a favorite
[**delete_site_favorite**](FavoritesApi.md#delete_site_favorite) | **DELETE** /people/{personId}/favorite-sites/{siteId} | Delete a site favorite
[**get_favorite**](FavoritesApi.md#get_favorite) | **GET** /people/{personId}/favorites/{favoriteId} | Get a favorite
[**get_favorite_site**](FavoritesApi.md#get_favorite_site) | **GET** /people/{personId}/favorite-sites/{siteId} | Get a favorite site
[**list_favorite_sites_for_person**](FavoritesApi.md#list_favorite_sites_for_person) | **GET** /people/{personId}/favorite-sites | List favorite sites
[**list_favorites**](FavoritesApi.md#list_favorites) | **GET** /people/{personId}/favorites | List favorites


# **create_favorite**
> FavoriteEntry create_favorite(person_idfavorite_body_create, opts)

Create a favorite

Favorite a **site**, **file**, or **folder** in the repository.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user.  **Note:** You can favorite more than one entity by  specifying a list of objects in the JSON body like this:  ```JSON [   {        \"target\": {           \"file\": {              \"guid\": \"abcde-01234-....\"           }        }    },    {        \"target\": {           \"file\": {              \"guid\": \"abcde-09863-....\"           }        }    }, ] ``` If you specify a list as input, then a paginated list rather than an entry is returned in the response body. For example:  ```JSON {   \"list\": {     \"pagination\": {       \"count\": 2,       \"hasMoreItems\": false,       \"totalItems\": 2,       \"skipCount\": 0,       \"maxItems\": 100     },     \"entries\": [       {         \"entry\": {           ...         }       },       {         \"entry\": {           ...         }       }     ]   } } ``` 

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

api_instance = AlfrescoAPI::FavoritesApi.new

person_id = "person_id_example" # String | The identifier of a person.

favorite_body_create = AlfrescoAPI::FavoriteBodyCreate.new # FavoriteBodyCreate | An object identifying the entity to be favorited.   The object consists of a single property which is an object with the name `site`, `file`, or `folder`.  The content of that object is the `guid` of the target entity.  For example, to favorite a file the following body would be used:  ```JSON {    \"target\": {       \"file\": {          \"guid\": \"abcde-01234-....\"       }    } } ``` 

opts = { 
  include: ["include_example"], # Array<String> | Returns additional information about favorites, the following optional fields can be requested: * path (note, this only applies to files and folders)   
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Create a favorite
  result = api_instance.create_favorite(person_idfavorite_body_create, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling FavoritesApi->create_favorite: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **favorite_body_create** | [**FavoriteBodyCreate**](FavoriteBodyCreate.md)| An object identifying the entity to be favorited.   The object consists of a single property which is an object with the name &#x60;site&#x60;, &#x60;file&#x60;, or &#x60;folder&#x60;.  The content of that object is the &#x60;guid&#x60; of the target entity.  For example, to favorite a file the following body would be used:  &#x60;&#x60;&#x60;JSON {    \&quot;target\&quot;: {       \&quot;file\&quot;: {          \&quot;guid\&quot;: \&quot;abcde-01234-....\&quot;       }    } } &#x60;&#x60;&#x60;  | 
 **include** | [**Array&lt;String&gt;**](String.md)| Returns additional information about favorites, the following optional fields can be requested: * path (note, this only applies to files and folders)    | [optional] 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**FavoriteEntry**](FavoriteEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_site_favorite**
> FavoriteSiteEntry create_site_favorite(person_idfavorite_site_body_create, opts)

Create a site favorite

**Note:** this endpoint is deprecated as of Alfresco 4.2, and will be removed in the future. Use `/people/{personId}/favorites` instead.  Create a site favorite for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user.   **Note:** You can favorite more than one site by  specifying a list of sites in the JSON body like this:  ```JSON [   {     \"id\": \"test-site-1\"   },   {     \"id\": \"test-site-2\"   } ] ``` If you specify a list as input, then a paginated list rather than an entry is returned in the response body. For example:  ```JSON {   \"list\": {     \"pagination\": {       \"count\": 2,       \"hasMoreItems\": false,       \"totalItems\": 2,       \"skipCount\": 0,       \"maxItems\": 100     },     \"entries\": [       {         \"entry\": {           ...         }       },       {         \"entry\": {           ...         }       }     ]   } } ``` 

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

api_instance = AlfrescoAPI::FavoritesApi.new

person_id = "person_id_example" # String | The identifier of a person.

favorite_site_body_create = AlfrescoAPI::FavoriteSiteBodyCreate.new # FavoriteSiteBodyCreate | The id of the site to favorite.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Create a site favorite
  result = api_instance.create_site_favorite(person_idfavorite_site_body_create, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling FavoritesApi->create_site_favorite: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **favorite_site_body_create** | [**FavoriteSiteBodyCreate**](FavoriteSiteBodyCreate.md)| The id of the site to favorite. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**FavoriteSiteEntry**](FavoriteSiteEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_favorite**
> delete_favorite(person_idfavorite_id)

Delete a favorite

Deletes **favoriteId** as a favorite of person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::FavoritesApi.new

person_id = "person_id_example" # String | The identifier of a person.

favorite_id = "favorite_id_example" # String | The identifier of a favorite.


begin
  #Delete a favorite
  api_instance.delete_favorite(person_idfavorite_id)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling FavoritesApi->delete_favorite: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **favorite_id** | **String**| The identifier of a favorite. | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_site_favorite**
> delete_site_favorite(person_idsite_id, )

Delete a site favorite

**Note:** this endpoint is deprecated as of Alfresco 4.2, and will be removed in the future. Use `/people/{personId}/favorites/{favoriteId}` instead.  Deletes site **siteId** from the favorite site list of person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::FavoritesApi.new

person_id = "person_id_example" # String | The identifier of a person.

site_id = "site_id_example" # String | The identifier of a site.


begin
  #Delete a site favorite
  api_instance.delete_site_favorite(person_idsite_id, )
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling FavoritesApi->delete_site_favorite: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **site_id** | **String**| The identifier of a site. | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_favorite**
> FavoriteEntry get_favorite(person_idfavorite_id, opts)

Get a favorite

Gets favorite **favoriteId** for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::FavoritesApi.new

person_id = "person_id_example" # String | The identifier of a person.

favorite_id = "favorite_id_example" # String | The identifier of a favorite.

opts = { 
  include: ["include_example"], # Array<String> | Returns additional information about favorites, the following optional fields can be requested: * path (note, this only applies to files and folders)   
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Get a favorite
  result = api_instance.get_favorite(person_idfavorite_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling FavoritesApi->get_favorite: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **favorite_id** | **String**| The identifier of a favorite. | 
 **include** | [**Array&lt;String&gt;**](String.md)| Returns additional information about favorites, the following optional fields can be requested: * path (note, this only applies to files and folders)    | [optional] 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**FavoriteEntry**](FavoriteEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_favorite_site**
> SiteEntry get_favorite_site(person_idsite_id, , opts)

Get a favorite site

**Note:** this endpoint is deprecated as of Alfresco 4.2, and will be removed in the future. Use `/people/{personId}/favorites/{favoriteId}` instead.  Gets information on favorite site **siteId** of person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::FavoritesApi.new

person_id = "person_id_example" # String | The identifier of a person.

site_id = "site_id_example" # String | The identifier of a site.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Get a favorite site
  result = api_instance.get_favorite_site(person_idsite_id, , opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling FavoritesApi->get_favorite_site: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **site_id** | **String**| The identifier of a site. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteEntry**](SiteEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_favorite_sites_for_person**
> SitePaging list_favorite_sites_for_person(person_id, opts)

List favorite sites

**Note:** this endpoint is deprecated as of Alfresco 4.2, and will be removed in the future. Use `/people/{personId}/favorites` instead.  Gets a list of a person's favorite sites.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::FavoritesApi.new

person_id = "person_id_example" # String | The identifier of a person.

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #List favorite sites
  result = api_instance.list_favorite_sites_for_person(person_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling FavoritesApi->list_favorite_sites_for_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SitePaging**](SitePaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_favorites**
> FavoritePaging list_favorites(person_id, opts)

List favorites

Gets a list of favorites for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user.  You can use the **where** parameter to restrict the list in the response to entries of a specific kind. The **where** parameter takes a value. The value is a single predicate that can include one or more **EXISTS** conditions. The **EXISTS** condition uses a single operand to limit the list to include entries that include that one property. The property values are:  *   `target/file` *   `target/folder` *   `target/site`  For example, the following **where** parameter restricts the returned list to the file favorites for a person:  ```SQL (EXISTS(target/file)) ``` You can specify more than one condition using **OR**. The predicate must be enclosed in parentheses.   For example, the following **where** parameter restricts the returned list to the file and folder favorites for a person:  ```SQL (EXISTS(target/file) OR EXISTS(target/folder)) ``` 

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

api_instance = AlfrescoAPI::FavoritesApi.new

person_id = "person_id_example" # String | The identifier of a person.

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  where: "where_example", # String | A string to restrict the returned objects by using a predicate.
  include: ["include_example"], # Array<String> | Returns additional information about favorites, the following optional fields can be requested: * path (note, this only applies to files and folders)   
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #List favorites
  result = api_instance.list_favorites(person_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling FavoritesApi->list_favorites: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]
 **where** | **String**| A string to restrict the returned objects by using a predicate. | [optional] 
 **include** | [**Array&lt;String&gt;**](String.md)| Returns additional information about favorites, the following optional fields can be requested: * path (note, this only applies to files and folders)    | [optional] 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**FavoritePaging**](FavoritePaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



