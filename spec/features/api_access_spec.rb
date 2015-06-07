require 'rails_helper'
require 'json'

RSpec.describe "api access", :type => :request do
  def sign_in_as_admin
    @admin ||= FactoryGirl.create(:admin)
    post_via_redirect(admin_session_path,
                      "admin[email]" => @admin.email,
                      "admin[password]" => @admin.password)
  end

  def response_json
    JSON.parse( response.body )
  end

  describe "api json export" do
    it 'exports all organizations as json by default' do
      create(:organization, name: "organization foo")
      create(:organization)
      sign_in_as_admin
      get "/api.json"
      expect(response_json.size).to eq(2)
      expect(response_json[0]['name']).to eq("organization foo")
    end
  end

  describe "api markdown export" do
    it 'spec_name' do
      create(:organization, name: "organization docx")
      sign_in_as_admin
      get "/api.markdown"
      expect(response.body).to include("# organization docx")
    end
  end

  describe "api docx export" do
    it 'spec_name' do
      create(:organization, name: "organization docx")
      sign_in_as_admin
      get "/api.docx"
      expect(response.body).not_to be_nil
    end
  end
end
