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
    it 'routes to the all action on default' do
      create(:organization, name: "organization foo")
      create(:organization)
      sign_in_as_admin
      get "/api"
      expect(response_json.size).to eq(2)
      expect(response_json[0]['name']).to eq("organization foo")
    end
  end
end
