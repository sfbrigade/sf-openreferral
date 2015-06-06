require 'rails_helper'

RSpec.describe ApiController, :type => :controller do
  it 'routes to the all action on default' do
    expect(:get => "/api").to route_to(
      :controller => "api",
      :action => "all",
    )
  end
end
