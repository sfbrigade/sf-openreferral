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
end
