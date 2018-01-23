# AlfrescoAPI::SharedLink

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**expires_at** | **DateTime** |  | [optional] 
**node_id** | **String** |  | [optional] 
**name** | **String** | The name must not contain spaces or the following special characters: * \&quot; &lt; &gt; \\ / ? : and |.  The character . must not be used at the end of the name.  | [optional] 
**title** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**modified_at** | **DateTime** |  | [optional] 
**modified_by_user** | [**UserInfo**](UserInfo.md) |  | [optional] 
**shared_by_user** | [**UserInfo**](UserInfo.md) |  | [optional] 
**content** | [**ContentInfo**](ContentInfo.md) |  | [optional] 
**allowable_operations** | **Array&lt;String&gt;** | The allowable operations for the Quickshare link itself. See allowableOperationsOnTarget for the allowable operations pertaining to the linked content node.  | [optional] 
**allowable_operations_on_target** | **Array&lt;String&gt;** | The allowable operations for the content node being shared.  | [optional] 


