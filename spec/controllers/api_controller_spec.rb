require 'rails_helper'
require 'json'

RSpec.describe ApiController, :type => :controller do
  before(:each) { login_admin }

  it 'routes to the all action on default' do
    expect(:get => api_export_all_path).to route_to(
      :controller => "api",
      :action => "export_all",
    )
  end

  it 'returns suppoprted formats' do
    get :export_formats
    expect(response_json).to include("markdown")
    expect(response_json).to include("docx")
    expect(response_json).to include("json")
  end

  describe "export" do
    it 'exports json' do
      create(:organization, name: "organization json")
      get :export_all, format: 'json'
      expect(response_json[0]['name']).to include("organization json")
    end

    it 'exports markdown' do
      create(:organization, name: "organization markdown")
      get :export_all, format: 'markdown'
      expect(response.body).to include("# organization markdown")
    end

    it 'exports docx' do
      create(:organization, name: "organization docx")
      get :export_all, format: 'docx'
      #how to test for correctly exported docx?
      expect(response.body).not_to be_nil
    end

    it 'requires format argument' do
      expect {
          get :export_all
      }.to raise_error(ActionController::RoutingError)
    end
  end

end
