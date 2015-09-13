require "rails_helper"
require "json"

RSpec.describe ApiController, :type => :controller do
  before(:each) { login_admin }

  it "routes to the all action on default" do
    expect(:get => api_export_all_path).to route_to(
      :controller => "api",
      :action => "export_all",
    )
  end

  it "returns suppoprted formats" do
    get :export_formats

    expect(response_json).to match_array(["markdown", "json"])
  end

  describe "export" do
    it "exports single json" do
      create(:organization, name: "organization 1")
      create(:organization, name: "organization 42", id: 42)

      get :export_organization, id: 42, format: :json

      expect(response_json.size).to eq(1)
      expect(response_json[0]["name"]).to include("organization 42")
    end

    it "exports all json" do
      create(:organization, name: "organization 1")
      create(:organization, name: "organization 2")

      get :export_all, format: "json"

      expect(response_json.size).to eq(2)
      expect(response_json[0]["name"]).to include("organization 1")
    end

    it "exports all markdown" do
      create(:organization, name: "organization markdown")
      create(:organization, name: "organization 2")

      get :export_all, format: "markdown"

      expect(response.body).to include("# organization markdown")
      expect(response.body).to include("# organization 2")
    end

    it "requires format argument" do
      expect do
        get :export_all
      end.to raise_error(ActionController::RoutingError)
    end
  end
end
