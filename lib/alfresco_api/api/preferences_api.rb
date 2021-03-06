=begin
#Alfresco Content Services REST API

#**Core API**  Provides access to the core features of Alfresco Content Services. 

OpenAPI spec version: 1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require "uri"

module AlfrescoAPI
  class PreferencesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Get a preference
    # Gets a specific preference for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. 
    # @param person_id The identifier of a person.
    # @param preference_name The name of the preference.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # @return [PreferenceEntry]
    def get_preference(person_id, preference_name, opts = {})
      data, _status_code, _headers = get_preference_with_http_info(person_id, preference_name, opts)
      return data
    end

    # Get a preference
    # Gets a specific preference for person **personId**.  You can use the &#x60;-me-&#x60; string in place of &#x60;&lt;personId&gt;&#x60; to specify the currently authenticated user. 
    # @param person_id The identifier of a person.
    # @param preference_name The name of the preference.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :fields A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # @return [Array<(PreferenceEntry, Fixnum, Hash)>] PreferenceEntry data, response status code and response headers
    def get_preference_with_http_info(person_id, preference_name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: PreferencesApi.get_preference ..."
      end
      # verify the required parameter 'person_id' is set
      if @api_client.config.client_side_validation && person_id.nil?
        fail ArgumentError, "Missing the required parameter 'person_id' when calling PreferencesApi.get_preference"
      end
      # verify the required parameter 'preference_name' is set
      if @api_client.config.client_side_validation && preference_name.nil?
        fail ArgumentError, "Missing the required parameter 'preference_name' when calling PreferencesApi.get_preference"
      end
      # resource path
      local_var_path = "/people/{personId}/preferences/{preferenceName}".sub('{' + 'personId' + '}', person_id.to_s).sub('{' + 'preferenceName' + '}', preference_name.to_s)

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
      post_body = nil
      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PreferenceEntry')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PreferencesApi#get_preference\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List preferences
    # Gets a list of preferences for person **personId**.  You can use the `-me-` string in place of `<personId>` to specify the currently authenticated user. Note that each preference consists of an **id** and a **value**.   The **value** can be of any JSON type. 
    # @param person_id The identifier of a person.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :skip_count The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0.  (default to 0)
    # @option opts [Integer] :max_items The maximum number of items to return in the list.  If not supplied then the default value is 100.  (default to 100)
    # @option opts [Array<String>] :fields A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # @return [PreferencePaging]
    def list_preferences(person_id, opts = {})
      data, _status_code, _headers = list_preferences_with_http_info(person_id, opts)
      return data
    end

    # List preferences
    # Gets a list of preferences for person **personId**.  You can use the &#x60;-me-&#x60; string in place of &#x60;&lt;personId&gt;&#x60; to specify the currently authenticated user. Note that each preference consists of an **id** and a **value**.   The **value** can be of any JSON type. 
    # @param person_id The identifier of a person.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :skip_count The number of entities that exist in the collection before those included in this list.  If not supplied then the default value is 0. 
    # @option opts [Integer] :max_items The maximum number of items to return in the list.  If not supplied then the default value is 100. 
    # @option opts [Array<String>] :fields A list of field names.  You can use this parameter to restrict the fields returned within a response if, for example, you want to save on overall bandwidth.  The list applies to a returned individual entity or entries within a collection.  If the API method also supports the **include** parameter, then the fields specified in the **include** parameter are returned in addition to those specified in the **fields** parameter. 
    # @return [Array<(PreferencePaging, Fixnum, Hash)>] PreferencePaging data, response status code and response headers
    def list_preferences_with_http_info(person_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: PreferencesApi.list_preferences ..."
      end
      # verify the required parameter 'person_id' is set
      if @api_client.config.client_side_validation && person_id.nil?
        fail ArgumentError, "Missing the required parameter 'person_id' when calling PreferencesApi.list_preferences"
      end
      if @api_client.config.client_side_validation && !opts[:'skip_count'].nil? && opts[:'skip_count'] < 0
        fail ArgumentError, 'invalid value for "opts[:"skip_count"]" when calling PreferencesApi.list_preferences, must be greater than or equal to 0.'
      end

      if @api_client.config.client_side_validation && !opts[:'max_items'].nil? && opts[:'max_items'] < 1
        fail ArgumentError, 'invalid value for "opts[:"max_items"]" when calling PreferencesApi.list_preferences, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = "/people/{personId}/preferences".sub('{' + 'personId' + '}', person_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'skipCount'] = opts[:'skip_count'] if !opts[:'skip_count'].nil?
      query_params[:'maxItems'] = opts[:'max_items'] if !opts[:'max_items'].nil?
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
      post_body = nil
      auth_names = ['basicAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PreferencePaging')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PreferencesApi#list_preferences\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
