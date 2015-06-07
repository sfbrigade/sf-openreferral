require 'rails_helper'
require 'json'

RSpec.describe "api access", :type => :request do
  def response_json
    JSON.parse( response.body )
  end

  describe "api json export" do
    it 'exports all organizations as json by default' do
      create(:organization, name: "organization foo")
      create(:organization)
      get "/api.json"
      expect(response_json.size).to eq(2)
      expect(response_json[0]['name']).to eq("organization foo")
    end
  end

  describe "api markdown export" do
    it 'spec_name' do
      create(:organization, name: "organization docx")
      get "/api.markdown"
      expect(response.body).to include("# organization docx")
    end
  end

  describe "api docx export" do
    it 'spec_name' do
      create(:organization, name: "organization docx")
      get "/api.docx"
      expect(response.body).not_to be_nil
    end
  end
end
