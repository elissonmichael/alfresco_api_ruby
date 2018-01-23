# AlfrescoAPI::NetworksApi

All URIs are relative to *https://localhost/alfresco/api/-default-/public/alfresco/versions/1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_network**](NetworksApi.md#get_network) | **GET** /networks/{networkId} | Get a network
[**get_network_for_person**](NetworksApi.md#get_network_for_person) | **GET** /people/{personId}/networks/{networkId} | Get network information
[**list_networks_for_person**](NetworksApi.md#list_networks_for_person) | **GET** /people/{personId}/networks | List network membership


# **get_network**
> PersonNetworkEntry get_network(network_id, opts)

Get a network

Gets information for a network **networkId**.

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

api_instance = AlfrescoAPI::NetworksApi.new

network_id = "network_id_example" # String | The identifier of a network.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Get a network
  result = api_instance.get_network(network_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling NetworksApi->get_network: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **network_id** | **String**| The identifier of a network. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**PersonNetworkEntry**](PersonNetworkEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_network_for_person**
> PersonNetworkEntry get_network_for_person(person_idnetwork_id, opts)

Get network information

Gets network information on a single network specified by **networkId** for **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::NetworksApi.new

person_id = "person_id_example" # String | The identifier of a person.

network_id = "network_id_example" # String | The identifier of a network.

opts = { 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #Get network information
  result = api_instance.get_network_for_person(person_idnetwork_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling NetworksApi->get_network_for_person: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person_id** | **String**| The identifier of a person. | 
 **network_id** | **String**| The identifier of a network. | 
 **fields** | [**Array&lt;String&gt;**](String.md)| A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter.  | [optional] 

### Return type

[**PersonNetworkEntry**](PersonNetworkEntry.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_networks_for_person**
> PersonNetworkPaging list_networks_for_person(person_id, opts)

List network membership

Gets a list of network memberships for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 

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

api_instance = AlfrescoAPI::NetworksApi.new

person_id = "person_id_example" # String | The identifier of a person.

opts = { 
  skip_count: 0, # Integer | The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
  max_items: 100, # Integer | The maximum number of items to return in the list.  If not supplied then the default value is 100. 
  fields: ["fields_example"] # Array<String> | A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
}

begin
  #List network membership
  result = api_instance.list_networks_for_person(person_id, opts)
  p result
rescue AlfrescoAPI::ApiError => e
  puts "Exception when calling NetworksApi->list_networks_for_person: #{e}"
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

[**PersonNetworkPaging**](PersonNetworkPaging.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



