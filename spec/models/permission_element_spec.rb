=begin
#Alfresco Content Services REST API

#**Core API**  Provides access to the core features of Alfresco Content Services. 

OpenAPI spec version: 1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for AlfrescoAPI::PermissionElement
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'PermissionElement' do
  before do
    # run before each test
    @instance = AlfrescoAPI::PermissionElement.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of PermissionElement' do
    it 'should create an instance of PermissionElement' do
      expect(@instance).to be_instance_of(AlfrescoAPI::PermissionElement)
    end
  end
  describe 'test attribute "authority_id"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "name"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "access_status"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
       #validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["ALLOWED", "DENIED"])
       #validator.allowable_values.each do |value|
       #  expect { @instance.access_status = value }.not_to raise_error
       #end
    end
  end

end
