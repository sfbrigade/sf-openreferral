require 'rails_helper'

RSpec.describe ApiHelper, type: :controller do
  include ApiHelper

  it 'exports organizations as markdown' do
    create(:organization, name: 'markdowned', emails: ['email@foo'])
    result = export_organizations_as_markdown( Organization.all.to_a )
    expect(result).to include('# markdowned')
    expect(result).to include('email@foo')
  end
end
