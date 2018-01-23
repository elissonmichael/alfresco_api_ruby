# AlfrescoAPI::SitesApi

All URIs are relative to *https://localhost/alfresco/api/-default-/public/alfresco/versions/1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_site**](SitesApi.md#create_site) | **POST** /sites | Create a site
[**create_site_membership**](SitesApi.md#create_site_membership) | **POST** /sites/{siteId}/members | Create a site membership
[**create_site_membership_request_for_person**](SitesApi.md#create_site_membership_request_for_person) | **POST** /people/{personId}/site-membership-requests | Create a site membership request
[**delete_site**](SitesApi.md#delete_site) | **DELETE** /sites/{siteId} | Delete a site
[**delete_site_membership**](SitesApi.md#delete_site_membership) | **DELETE** /sites/{siteId}/members/{personId} | Delete a site membership
[**delete_site_membership_for_person**](SitesApi.md#delete_site_membership_for_person) | **DELETE** /people/{personId}/sites/{siteId} | Delete a site membership
[**delete_site_membership_request_for_person**](SitesApi.md#delete_site_membership_request_for_person) | **DELETE** /people/{personId}/site-membership-requests/{siteId} | Delete a site membership request
[**get_site**](SitesApi.md#get_site) | **GET** /sites/{siteId} | Get a site
[**get_site_container**](SitesApi.md#get_site_container) | **GET** /sites/{siteId}/containers/{containerId} | Get a site container
[**get_site_membership**](SitesApi.md#get_site_membership) | **GET** /sites/{siteId}/members/{personId} | Get a site membership
[**get_site_membership_for_person**](SitesApi.md#get_site_membership_for_person) | **GET** /people/{personId}/sites/{siteId} | Get a site membership
[**get_site_membership_request_for_person**](SitesApi.md#get_site_membership_request_for_person) | **GET** /people/{personId}/site-membership-requests/{siteId} | Get a site membership request
[**list_site_containers**](SitesApi.md#list_site_containers) | **GET** /sites/{siteId}/containers | List site containers
[**list_site_membership_requests_for_person**](SitesApi.md#list_site_membership_requests_for_person) | **GET** /people/{personId}/site-membership-requests | List site membership requests
[**list_site_memberships**](SitesApi.md#list_site_memberships) | **GET** /sites/{siteId}/members | List site memberships
[**list_site_memberships_for_person**](SitesApi.md#list_site_memberships_for_person) | **GET** /people/{personId}/sites | List site memberships
[**list_sites**](SitesApi.md#list_sites) | **GET** /sites | List sites
[**update_site**](SitesApi.md#update_site) | **PUT** /sites/{siteId} | Update a site
[**update_site_membership**](SitesApi.md#update_site_membership) | **PUT** /sites/{siteId}/members/{personId} | Update a site membership
[**update_site_membership_request_for_person**](SitesApi.md#update_site_membership_request_for_person) | **PUT** /people/{personId}/site-membership-requests/{siteId} | Update a site membership request


# **create_site**
> SiteEntry create_site(site_body_create, opts)

Create a site

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Creates a default site with the given details.  Unless explicitly specified, the site id will be generated from the site title. The site id must be unique and only contain alphanumeric and/or dash characters.  Note: the id of a site cannot be updated once the site has been created.  For example, to create a public site called \"Marketing\" the following body could be used: ```JSON {   \"title\": \"Marketing\",   \"visibility\": \"PUBLIC\" } ```  The creation of the (surf) configuration files required by Share can be skipped via the **skipConfiguration** query parameter.  **Note:** if skipped then such a site will **not** work within Share.  The addition of the site to the user's site favorites can be skipped via the **skipAddToFavorites** query parameter.  The creator will be added as a member with Site Manager role.  When you create a site, a container called **documentLibrary** is created for you in the new site.  This container is the root folder for content stored in the site. 

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

api_instance = AlfrescoAPI::SitesApi.new

site_body_create = AlfrescoAPI::SiteBodyCreate.new # SiteBodyCreate | The site details

opts = { 
  skip_configuration: false, # BOOLEAN | Flag to indicate whether the Share-specific (surf) configuration files for the site should not be created.
  skip_add_to_favorites: false, # BOOLEAN | Flag to indicate whether the site should not be added to the user's site favorites.
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Create a site
  result = api_instance.create_site(site_body_create, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->create_site: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_body_create** | [**SiteBodyCreate**](SiteBodyCreate.md)| The site details | 
 **skip_configuration** | **BOOLEAN**| Flag to indicate whether the Share-specific (surf) configuration files for the site should not be created. | [optional] [default to false]
 **skip_add_to_favorites** | **BOOLEAN**| Flag to indicate whether the site should not be added to the user&#39;s site favorites. | [optional] [default to false]
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteEntry**](SiteEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_site_membership**
> SiteMemberEntry create_site_membership(site_id, site_membership_body_create, opts)

Create a site membership

Creates a site membership for person **personId** on site **siteId**.  You can set the **role** to one of four types:  * SiteConsumer * SiteCollaborator * SiteContributor * SiteManager  **Note:** You can create more than one site membership by  specifying a list of people in the JSON body like this:  ```JSON [   {     \"role\": \"SiteConsumer\",     \"id\": \"joe\"   },   {     \"role\": \"SiteConsumer\",     \"id\": \"fred\"   } ] ``` If you specify a list as input, then a paginated list rather than an entry is returned in the response body. For example:  ```JSON {   \"list\": {     \"pagination\": {       \"count\": 2,       \"hasMoreItems\": false,       \"totalItems\": 2,       \"skipCount\": 0,       \"maxItems\": 100     },     \"entries\": [       {         \"entry\": {           ...         }       },       {         \"entry\": {           ...         }       }     ]   } } ``` 

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

site_membership_body_create = AlfrescoAPI::SiteMembershipBodyCreate.new # SiteMembershipBodyCreate | The person to add and their role

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Create a site membership
  result = api_instance.create_site_membership(site_id, site_membership_body_create, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->create_site_membership: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **site_membership_body_create** | [**SiteMembershipBodyCreate**](SiteMembershipBodyCreate.md)| The person to add and their role | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteMemberEntry**](SiteMemberEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_site_membership_request_for_person**
> SiteMembershipRequestEntry create_site_membership_request_for_person(person_idsite_membership_request_body_create, opts)

Create a site membership request

Create a site membership request for yourself on the site with the identifier of **id**, specified in the JSON body.  The result of the request differs depending on the type of site.  * For a **public** site, you join the site immediately as a SiteConsumer. * For a **moderated** site, your request is added to the site membership request list. The request waits for approval from the Site Manager. * You cannot request membership of a **private** site. Members are invited by the site administrator.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user.   **Note:** You can create site membership requests for more than one site by  specifying a list of sites in the JSON body like this:  ```JSON [   {     \"message\": \"Please can you add me\",     \"id\": \"test-site-1\",     \"title\": \"Request for test site 1\",   },   {     \"message\": \"Please can you add me\",     \"id\": \"test-site-2\",     \"title\": \"Request for test site 2\",   } ] ``` If you specify a list as input, then a paginated list rather than an entry is returned in the response body. For example:  ```JSON {   \"list\": {     \"pagination\": {       \"count\": 2,       \"hasMoreItems\": false,       \"totalItems\": 2,       \"skipCount\": 0,       \"maxItems\": 100     },     \"entries\": [       {         \"entry\": {           ...         }       },       {         \"entry\": {           ...         }       }     ]   } } ``` 

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

api_instance = AlfrescoAPI::SitesApi.new

person_id = "person_id_example" # String | The identifier of a person.

site_membership_request_body_create = AlfrescoAPI::SiteMembershipRequestBodyCreate.new # SiteMembershipRequestBodyCreate | Site membership request details

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Create a site membership request
  result = api_instance.create_site_membership_request_for_person(person_idsite_membership_request_body_create, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->create_site_membership_request_for_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **site_membership_request_body_create** | [**SiteMembershipRequestBodyCreate**](SiteMembershipRequestBodyCreate.md)| Site membership request details | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteMembershipRequestEntry**](SiteMembershipRequestEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_site**
> delete_site(site_id, , opts)

Delete a site

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Deletes the site with **siteId**. 

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

opts = { 
  permanent: false # BOOLEAN | Flag to indicate whether the site should be permanently deleted i.e. bypass the trashcan.
}

begin
  #Delete a site
  api_instance.delete_site(site_id, , opts)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->delete_site: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **permanent** | **BOOLEAN**| Flag to indicate whether the site should be permanently deleted i.e. bypass the trashcan. | [optional] [default to false]

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_site_membership**
> delete_site_membership(site_id, person_id)

Delete a site membership

Deletes person **personId** as a member of site **siteId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

person_id = "person_id_example" # String | The identifier of a person.


begin
  #Delete a site membership
  api_instance.delete_site_membership(site_id, person_id)
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->delete_site_membership: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **person_id** | **String**| The identifier of a person. | 

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_site_membership_for_person**
> delete_site_membership_for_person(person_idsite_id, )

Delete a site membership

Deletes person **personId** as a member of site **siteId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::SitesApi.new

person_id = "person_id_example" # String | The identifier of a person.

site_id = "site_id_example" # String | The identifier of a site.


begin
  #Delete a site membership
  api_instance.delete_site_membership_for_person(person_idsite_id, )
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->delete_site_membership_for_person: #{e}"
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



# **delete_site_membership_request_for_person**
> delete_site_membership_request_for_person(person_idsite_id, )

Delete a site membership request

Deletes the site membership request to site **siteId** for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::SitesApi.new

person_id = "person_id_example" # String | The identifier of a person.

site_id = "site_id_example" # String | The identifier of a site.


begin
  #Delete a site membership request
  api_instance.delete_site_membership_request_for_person(person_idsite_id, )
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->delete_site_membership_request_for_person: #{e}"
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



# **get_site**
> SiteEntry get_site(site_id, , opts)

Get a site

Gets information for site **siteId**.  You can use the **relations** parameter to include one or more related entities in a single response and so reduce network traffic.  The entity types in Alfresco are organized in a tree structure. The **sites** entity has two children, **containers** and **members**. The following relations parameter returns all the container and member objects related to the site **siteId**:  ``` containers,members ``` 

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

opts = { 
  relations: ["relations_example"], # Array<String> | Use the relations parameter to include one or more related entities in a single response.
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Get a site
  result = api_instance.get_site(site_id, , opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->get_site: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **relations** | [**Array&lt;String&gt;**](String.md)| Use the relations parameter to include one or more related entities in a single response. | [optional] 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteEntry**](SiteEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_site_container**
> SiteContainerEntry get_site_container(site_id, container_id, opts)

Get a site container

Gets information on the container **containerId** in site **siteId**.

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

container_id = "container_id_example" # String | The unique identifier of a site container.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Get a site container
  result = api_instance.get_site_container(site_id, container_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->get_site_container: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **container_id** | **String**| The unique identifier of a site container. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteContainerEntry**](SiteContainerEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_site_membership**
> SiteMemberEntry get_site_membership(site_id, person_id, opts)

Get a site membership

Gets site membership information for person **personId** on site **siteId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

person_id = "person_id_example" # String | The identifier of a person.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Get a site membership
  result = api_instance.get_site_membership(site_id, person_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->get_site_membership: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **person_id** | **String**| The identifier of a person. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteMemberEntry**](SiteMemberEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_site_membership_for_person**
> SiteRoleEntry get_site_membership_for_person(person_idsite_id, )

Get a site membership

Gets site membership information for person **personId** on site **siteId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::SitesApi.new

person_id = "person_id_example" # String | The identifier of a person.

site_id = "site_id_example" # String | The identifier of a site.


begin
  #Get a site membership
  result = api_instance.get_site_membership_for_person(person_idsite_id, )
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->get_site_membership_for_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **site_id** | **String**| The identifier of a site. | 

### Return type

[**SiteRoleEntry**](SiteRoleEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_site_membership_request_for_person**
> SiteMembershipRequestEntry get_site_membership_request_for_person(person_idsite_id, , opts)

Get a site membership request

Gets the site membership request for site **siteId** for person **personId**, if one exists.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::SitesApi.new

person_id = "person_id_example" # String | The identifier of a person.

site_id = "site_id_example" # String | The identifier of a site.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Get a site membership request
  result = api_instance.get_site_membership_request_for_person(person_idsite_id, , opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->get_site_membership_request_for_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **site_id** | **String**| The identifier of a site. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteMembershipRequestEntry**](SiteMembershipRequestEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_site_containers**
> SiteContainerPaging list_site_containers(site_id, , opts)

List site containers

Gets a list of containers for the site **siteId**.

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #List site containers
  result = api_instance.list_site_containers(site_id, , opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->list_site_containers: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteContainerPaging**](SiteContainerPaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_site_membership_requests_for_person**
> SiteMembershipRequestPaging list_site_membership_requests_for_person(person_id, opts)

List site membership requests

Gets a list of the current site membership requests for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::SitesApi.new

person_id = "person_id_example" # String | The identifier of a person.

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #List site membership requests
  result = api_instance.list_site_membership_requests_for_person(person_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->list_site_membership_requests_for_person: #{e}"
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

[**SiteMembershipRequestPaging**](SiteMembershipRequestPaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_site_memberships**
> SiteMemberPaging list_site_memberships(site_id, , opts)

List site memberships

Gets a list of site memberships for site **siteId**.

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #List site memberships
  result = api_instance.list_site_memberships(site_id, , opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->list_site_memberships: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteMemberPaging**](SiteMemberPaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_site_memberships_for_person**
> SiteRolePaging list_site_memberships_for_person(person_id, opts)

List site memberships

Gets a list of site membership information for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user.  You can use the **where** parameter to filter the returned sites by **visibility** or site **preset**.  Example to filter by **visibility**, use any one of:  ``` (visibility='PRIVATE') (visibility='PUBLIC') (visibility='MODERATED') ```  Example to filter by site **preset**:  ``` (preset='site-dashboard') ```  The default sort order for the returned list is for sites to be sorted by ascending title. You can override the default by using the **orderBy** parameter. You can specify one or more of the following fields in the **orderBy** parameter: * id * title * role 

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

api_instance = AlfrescoAPI::SitesApi.new

person_id = "person_id_example" # String | The identifier of a person.

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  order_by: ["order_by_example"], # Array<String> | A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
  relations: ["relations_example"], # Array<String> | Use the relations parameter to include one or more related entities in a single response.
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
  where: "where_example", # String | A string to restrict the returned objects by using a predicate.
}

begin
  #List site memberships
  result = api_instance.list_site_memberships_for_person(person_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->list_site_memberships_for_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]
 **order_by** | [**Array&lt;String&gt;**](String.md)| A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field.  | [optional] 
 **relations** | [**Array&lt;String&gt;**](String.md)| Use the relations parameter to include one or more related entities in a single response. | [optional] 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 
 **where** | **String**| A string to restrict the returned objects by using a predicate. | [optional] 

### Return type

[**SiteRolePaging**](SiteRolePaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_sites**
> SitePaging list_sites(opts)

List sites

Gets a list of sites in this repository.  You can use the **where** parameter to filter the returned sites by **visibility** or site **preset**.  Example to filter by **visibility**, use any one of:  ``` (visibility='PRIVATE') (visibility='PUBLIC') (visibility='MODERATED') ```  Example to filter by site **preset**:  ``` (preset='site-dashboard') ```  The default sort order for the returned list is for sites to be sorted by ascending title. You can override the default by using the **orderBy** parameter. You can specify one or more of the following fields in the **orderBy** parameter: * id * title * description  You can use the **relations** parameter to include one or more related entities in a single response and so reduce network traffic.  The entity types in Alfresco are organized in a tree structure. The **sites** entity has two children, **containers** and **members**. The following relations parameter returns all the container and member objects related to each site:  ``` containers,members ``` 

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

api_instance = AlfrescoAPI::SitesApi.new

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  order_by: ["order_by_example"], # Array<String> | A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field. 
  relations: ["relations_example"], # Array<String> | Use the relations parameter to include one or more related entities in a single response.
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
  where: "where_example", # String | A string to restrict the returned objects by using a predicate.
}

begin
  #List sites
  result = api_instance.list_sites(opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->list_sites: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **skip_count** | **Integer**| The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  | [optional] [default to 0]
 **max_items** | **Integer**| The maximum number of items to return in the list.  If not supplied then the default value is 100.  | [optional] [default to 100]
 **order_by** | [**Array&lt;String&gt;**](String.md)| A string to control the order of the entities returned in a list. You can use the **orderBy** parameter to sort the list by one or more fields.  Each field has a default sort order, which is normally ascending order. Read the API method implementation notes above to check if any fields used in this method have a descending default search order.  To sort the entities in a specific order, you can use the **ASC** and **DESC** keywords for any field.  | [optional] 
 **relations** | [**Array&lt;String&gt;**](String.md)| Use the relations parameter to include one or more related entities in a single response. | [optional] 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 
 **where** | **String**| A string to restrict the returned objects by using a predicate. | [optional] 

### Return type

[**SitePaging**](SitePaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_site**
> SiteEntry update_site(site_id, site_body_update, opts)

Update a site

**Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Update the details for the given site **siteId**. Site Manager or otherwise a  (site) admin can update title, description or visibility.  Note: the id of a site cannot be updated once the site has been created. 

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

site_body_update = AlfrescoAPI::SiteBodyUpdate.new # SiteBodyUpdate | The site information to update.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Update a site
  result = api_instance.update_site(site_id, site_body_update, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->update_site: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **site_body_update** | [**SiteBodyUpdate**](SiteBodyUpdate.md)| The site information to update. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteEntry**](SiteEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_site_membership**
> SiteMemberEntry update_site_membership(site_id, person_idsite_membership_body_update, opts)

Update a site membership

Update the membership of person **personId** in site **siteId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user.  You can set the **role** to one of four types:  * SiteConsumer * SiteCollaborator * SiteContributor * SiteManager 

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

api_instance = AlfrescoAPI::SitesApi.new

site_id = "site_id_example" # String | The identifier of a site.

person_id = "person_id_example" # String | The identifier of a person.

site_membership_body_update = AlfrescoAPI::SiteMembershipBodyUpdate.new # SiteMembershipBodyUpdate | The persons new role

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Update a site membership
  result = api_instance.update_site_membership(site_id, person_idsite_membership_body_update, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->update_site_membership: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**| The identifier of a site. | 
 **person_id** | **String**| The identifier of a person. | 
 **site_membership_body_update** | [**SiteMembershipBodyUpdate**](SiteMembershipBodyUpdate.md)| The persons new role | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteMemberEntry**](SiteMemberEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_site_membership_request_for_person**
> SiteMembershipRequestEntry update_site_membership_request_for_person(person_idsite_id, site_membership_request_body_update, opts)

Update a site membership request

Updates the message for the site membership request to site **siteId** for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::SitesApi.new

person_id = "person_id_example" # String | The identifier of a person.

site_id = "site_id_example" # String | The identifier of a site.

site_membership_request_body_update = AlfrescoAPI::SiteMembershipRequestBodyUpdate.new # SiteMembershipRequestBodyUpdate | The new message to display

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Update a site membership request
  result = api_instance.update_site_membership_request_for_person(person_idsite_id, site_membership_request_body_update, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling SitesApi->update_site_membership_request_for_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **site_id** | **String**| The identifier of a site. | 
 **site_membership_request_body_update** | [**SiteMembershipRequestBodyUpdate**](SiteMembershipRequestBodyUpdate.md)| The new message to display | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**SiteMembershipRequestEntry**](SiteMembershipRequestEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



