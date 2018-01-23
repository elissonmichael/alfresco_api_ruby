# AlfrescoAPI::Node

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**name** | **String** | The name must not contain spaces or the following special characters: * \&quot; &lt; &gt; \\ / ? : and |. The character . must not be used at the end of the name.  | 
**node_type** | **String** |  | 
**is_folder** | **BOOLEAN** |  | 
**is_file** | **BOOLEAN** |  | 
**is_locked** | **BOOLEAN** |  | [optional] [default to false]
**modified_at** | **DateTime** |  | 
**modified_by_user** | [**UserInfo**](UserInfo.md) |  | 
**created_at** | **DateTime** |  | 
**created_by_user** | [**UserInfo**](UserInfo.md) |  | 
**parent_id** | **String** |  | [optional] 
**is_link** | **BOOLEAN** |  | [optional] 
**content** | [**ContentInfo**](ContentInfo.md) |  | [optional] 
**aspect_names** | **Array&lt;String&gt;** |  | [optional] 
**properties** | **Object** |  | [optional] 
**allowable_operations** | **Array&lt;String&gt;** |  | [optional] 
**path** | [**PathInfo**](PathInfo.md) |  | [optional] 
**permissions** | [**PermissionsInfo**](PermissionsInfo.md) |  | [optional] 


