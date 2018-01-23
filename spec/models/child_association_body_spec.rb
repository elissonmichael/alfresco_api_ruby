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

# Unit tests for AlfrescoAPI::ChildAssociationBody
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ChildAssociationBody' do
  before do
    # run before each test
    @instance = AlfrescoAPI::ChildAssociationBody.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ChildAssociationBody' do
    it 'should create an instance of ChildAssociationBody' do
      expect(@instance).to be_instance_of(AlfrescoAPI::ChildAssociationBody)
    end
  end
  describe 'test attribute "child_id"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "assoc_type"' do
    it 'should work' do
       # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
