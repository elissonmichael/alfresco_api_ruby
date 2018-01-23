# AlfrescoAPI::Version

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | 
**version_comment** | **String** |  | [optional] 
**name** | **String** | The name must not contain spaces or the following special characters: * \&quot; &lt; &gt; \\ / ? : and |.  The character . must not be used at the end of the name.  | 
**node_type** | **String** |  | 
**is_folder** | **BOOLEAN** |  | 
**is_file** | **BOOLEAN** |  | 
**modified_at** | **DateTime** |  | 
**modified_by_user** | [**UserInfo**](UserInfo.md) |  | 
**content** | [**ContentInfo**](ContentInfo.md) |  | [optional] 
**aspect_names** | **Array&lt;String&gt;** |  | [optional] 
**properties** | **Hash&lt;String, String&gt;** |  | [optional] 


