# AlfrescoAPI::NodeBodyCreate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name must not contain spaces or the following special characters: * \&quot; &lt; &gt; \\ / ? : and |. The character . must not be used at the end of the name.  | 
**node_type** | **String** |  | 
**aspect_names** | **Array&lt;String&gt;** |  | [optional] 
**properties** | **Hash&lt;String, String&gt;** |  | [optional] 
**relative_path** | **String** |  | [optional] 
**association** | [**NodeBodyCreateAssociation**](NodeBodyCreateAssociation.md) |  | [optional] 
**secondary_children** | [**Array&lt;ChildAssociationBody&gt;**](ChildAssociationBody.md) |  | [optional] 
**targets** | [**Array&lt;AssociationBody&gt;**](AssociationBody.md) |  | [optional] 


