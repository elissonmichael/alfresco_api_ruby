=begin
#Alfresco Content Services REST API

#**Core API**  Provides access to the core features of Alfresco Content Services. 

OpenAPI spec version: 1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require "uri"

module AlfrescoAPI
  class VersionsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Delete a version
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Delete the version identified by **versionId** and **nodeId*.  If the version is successfully deleted then the content and metadata for that versioned node will be deleted and will no longer appear in the version history. This operation cannot be undone.  If the most recent version is deleted the live node will revert to the next most recent version.  We currently do not allow the last version to be deleted. If you wish to clear the history then you can remove the \"cm:versionable\" aspect (via update node) which will also disable versioning. In this case, you can re-enable versioning by adding back the \"cm:versionable\" aspect or using the version  params (majorVersion and comment) on a subsequent file content update. 
    # @param node_id The identifier of a node.
    # @param version_id The identifier of a version, ie. version label, within the version history of a node.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_version(node_id, version_id, opts = {})
      delete_version_with_http_info(node_id, version_id, opts)
      return nil
    end

    # Delete a version
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Delete the version identified by **versionId** and **nodeId*.  If the version is successfully deleted then the content and metadata for that versioned node will be deleted and will no longer appear in the version history. This operation cannot be undone.  If the most recent version is deleted the live node will revert to the next most recent version.  We currently do not allow the last version to be deleted. If you wish to clear the history then you can remove the \&quot;cm:versionable\&quot; aspect (via update node) which will also disable versioning. In this case, you can re-enable versioning by adding back the \&quot;cm:versionable\&quot; aspect or using the version  params (majorVersion and comment) on a subsequent file content update. 
    # @param node_id The identifier of a node.
    # @param version_id The identifier of a version, ie. version label, within the version history of a node.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_version_with_http_info(node_id, version_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: VersionsApi.delete_version ..."
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling VersionsApi.delete_version"
      end
      # verify the required parameter 'version_id' is set
      if @api_client.config.client_side_validation && version_id.nil?
        fail ArgumentError, "Missing the required parameter 'version_id' when calling VersionsApi.delete_version"
      end
      # resource path
      local_var_path = "/nodes/{nodeId}/versions/{versionId}".sub('{' + 'nodeId' + '}', node_id.to_s).sub('{' + 'versionId' + '}', version_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VersionsApi#delete_version\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get version information
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the version information for **versionId** of file node **nodeId**. 
    # @param node_id The identifier of a node.
    # @param version_id The identifier of a version, ie. version label, within the version history of a node.
    # @param [Hash] opts the optional parameters
    # @return [VersionEntry]
    def get_version(node_id, version_id, opts = {})
      data, _status_code, _headers = get_version_with_http_info(node_id, version_id, opts)
      return data
    end

    # Get version information
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the version information for **versionId** of file node **nodeId**. 
    # @param node_id The identifier of a node.
    # @param version_id The identifier of a version, ie. version label, within the version history of a node.
    # @param [Hash] opts the optional parameters
    # @return [Array<(VersionEntry, Fixnum, Hash)>] VersionEntry data, response status code and response headers
    def get_version_with_http_info(node_id, version_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: VersionsApi.get_version ..."
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling VersionsApi.get_version"
      end
      # verify the required parameter 'version_id' is set
      if @api_client.config.client_side_validation && version_id.nil?
        fail ArgumentError, "Missing the required parameter 'version_id' when calling VersionsApi.get_version"
      end
      # resource path
      local_var_path = "/nodes/{nodeId}/versions/{versionId}".sub('{' + 'nodeId' + '}', node_id.to_s).sub('{' + 'versionId' + '}', version_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'VersionEntry')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VersionsApi#get_version\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get version content
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the version content for **versionId** of file node **nodeId**. 
    # @param node_id The identifier of a node.
    # @param version_id The identifier of a version, ie. version label, within the version history of a node.
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :attachment **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response.  (default to true)
    # @option opts [DateTime] :if_modified_since Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, &#x60;Wed, 09 Mar 2016 16:56:34 GMT&#x60;. 
    # @return [nil]
    def get_version_content(node_id, version_id, opts = {})
      get_version_content_with_http_info(node_id, version_id, opts)
      return nil
    end

    # Get version content
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the version content for **versionId** of file node **nodeId**. 
    # @param node_id The identifier of a node.
    # @param version_id The identifier of a version, ie. version label, within the version history of a node.
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :attachment **true** enables a web browser to download the file as an attachment. **false** means a web browser may preview the file in a new tab or window, but not download the file.  You can only set this parameter to **false** if the content type of the file is in the supported list; for example, certain image files and PDF files.  If the content type is not supported for preview, then a value of **false**  is ignored, and the attachment will be returned in the response. 
    # @option opts [DateTime] :if_modified_since Only returns the content if it has been modified since the date provided. Use the date format defined by HTTP. For example, &#x60;Wed, 09 Mar 2016 16:56:34 GMT&#x60;. 
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def get_version_content_with_http_info(node_id, version_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: VersionsApi.get_version_content ..."
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling VersionsApi.get_version_content"
      end
      # verify the required parameter 'version_id' is set
      if @api_client.config.client_side_validation && version_id.nil?
        fail ArgumentError, "Missing the required parameter 'version_id' when calling VersionsApi.get_version_content"
      end
      # resource path
      local_var_path = "/nodes/{nodeId}/versions/{versionId}/content".sub('{' + 'nodeId' + '}', node_id.to_s).sub('{' + 'versionId' + '}', version_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'attachment'] = opts[:'attachment'] if !opts[:'attachment'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])
      header_params[:'If-Modified-Since'] = opts[:'if_modified_since'] if !opts[:'if_modified_since'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VersionsApi#get_version_content\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List version history
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the version history as an ordered list of versions for the specified **nodeId**.  The list is ordered in descending modified order. So the most recent version is first and  the original version is last in the list.  
    # @param node_id The identifier of a node.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :include Returns additional information about the version node. The following optional fields can be requested: * properties * aspectNames 
    # @option opts [Array<String>] :fields A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # @option opts [Integer] :skip_count The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  (default to 0)
    # @option opts [Integer] :max_items The maximum number of items to return in the list.  If not supplied then the default value is 100.  (default to 100)
    # @return [VersionPaging]
    def list_version_history(node_id, opts = {})
      data, _status_code, _headers = list_version_history_with_http_info(node_id, opts)
      return data
    end

    # List version history
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Gets the version history as an ordered list of versions for the specified **nodeId**.  The list is ordered in descending modified order. So the most recent version is first and  the original version is last in the list.  
    # @param node_id The identifier of a node.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :include Returns additional information about the version node. The following optional fields can be requested: * properties * aspectNames 
    # @option opts [Array<String>] :fields A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # @option opts [Integer] :skip_count The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
    # @option opts [Integer] :max_items The maximum number of items to return in the list.  If not supplied then the default value is 100. 
    # @return [Array<(VersionPaging, Fixnum, Hash)>] VersionPaging data, response status code and response headers
    def list_version_history_with_http_info(node_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: VersionsApi.list_version_history ..."
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling VersionsApi.list_version_history"
      end
      if @api_client.config.client_side_validation && !opts[:'skip_count'].nil? && opts[:'skip_count'] < 0
        fail ArgumentError, 'invalid value for "opts[:"skip_count"]" when calling VersionsApi.list_version_history, must be greater than or equal to 0.'
      end

      if @api_client.config.client_side_validation && !opts[:'max_items'].nil? && opts[:'max_items'] < 1
        fail ArgumentError, 'invalid value for "opts[:"max_items"]" when calling VersionsApi.list_version_history, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = "/nodes/{nodeId}/versions".sub('{' + 'nodeId' + '}', node_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'include'] = @api_client.build_collection_param(opts[:'include'], :csv) if !opts[:'include'].nil?
      query_params[:'fields'] = @api_client.build_collection_param(opts[:'fields'], :csv) if !opts[:'fields'].nil?
      query_params[:'skipCount'] = opts[:'skip_count'] if !opts[:'skip_count'].nil?
      query_params[:'maxItems'] = opts[:'max_items'] if !opts[:'max_items'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'VersionPaging')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VersionsApi#list_version_history\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Revert a version
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Attempts to revert the version identified by **versionId** and **nodeId** to the live node.  If the node is successfully reverted then the content and metadata for that versioned node will be promoted to the live node and a new version will appear in the version history. 
    # @param node_id The identifier of a node.
    # @param version_id The identifier of a version, ie. version label, within the version history of a node.
    # @param revert_body Optionally, specify a version comment and whether this should be a major version, or not.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # @return [VersionEntry]
    def revert_version(node_id, version_id, revert_body, opts = {})
      data, _status_code, _headers = revert_version_with_http_info(node_id, version_id, revert_body, opts)
      return data
    end

    # Revert a version
    # **Note:** this endpoint is available in Alfresco 5.2 and newer versions.  Attempts to revert the version identified by **versionId** and **nodeId** to the live node.  If the node is successfully reverted then the content and metadata for that versioned node will be promoted to the live node and a new version will appear in the version history. 
    # @param node_id The identifier of a node.
    # @param version_id The identifier of a version, ie. version label, within the version history of a node.
    # @param revert_body Optionally, specify a version comment and whether this should be a major version, or not.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # @return [Array<(VersionEntry, Fixnum, Hash)>] VersionEntry data, response status code and response headers
    def revert_version_with_http_info(node_id, version_id, revert_body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: VersionsApi.revert_version ..."
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling VersionsApi.revert_version"
      end
      # verify the required parameter 'version_id' is set
      if @api_client.config.client_side_validation && version_id.nil?
        fail ArgumentError, "Missing the required parameter 'version_id' when calling VersionsApi.revert_version"
      end
      # verify the required parameter 'revert_body' is set
      if @api_client.config.client_side_validation && revert_body.nil?
        fail ArgumentError, "Missing the required parameter 'revert_body' when calling VersionsApi.revert_version"
      end
      # resource path
      local_var_path = "/nodes/{nodeId}/versions/{versionId}/revert".sub('{' + 'nodeId' + '}', node_id.to_s).sub('{' + 'versionId' + '}', version_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'fields'] = @api_client.build_collection_param(opts[:'fields'], :csv) if !opts[:'fields'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(revert_body)
      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'VersionEntry')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VersionsApi#revert_version\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
