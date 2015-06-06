require 'rails_helper'
require 'json'

RSpec.describe "api access", :type => :request do
  def response_json
    JSON.parse( response.body )
  end

  describe "api json export" do
    it 'routes to the all action on default' do
      create(:organization, name: "organization foo")
      create(:organization)
      get "/api"
      expect(response_json.size).to eq(2)
      expect(response_json[0]['name']).to eq("organization foo")
    end
  end
end
