require 'rails_helper'
require 'json'

RSpec.describe "api access", :type => :request do
  def sign_in_as_admin
    @admin ||= FactoryGirl.create(:admin)
    post_via_redirect(admin_session_path,
                      "admin[email]" => @admin.email,
                      "admin[password]" => @admin.password)
  end

  before(:each) do
    sign_in_as_admin
  end

  describe "api json export" do
    it 'exports all organizations as json by default' do
      create(:organization, name: "organization foo")
      create(:organization)
      get "#{api_export_all_path}.json"
      expect(response_json.size).to eq(2)
      expect(response_json[0]['name']).to eq("organization foo")
    end
  end

  describe "api markdown export" do
    it 'spec_name' do
      create(:organization, name: "organization docx")
      get "#{api_export_all_path}.markdown"
      expect(response.body).to include("# organization docx")
    end
  end
end
