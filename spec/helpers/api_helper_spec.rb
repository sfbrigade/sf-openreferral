require 'rails_helper'

RSpec.describe ApiHelper, type: :controller do
  include ApiHelper
  it 'exportx organizations as markdown' do
    create(:organization, name: 'markdowned', email: 'email@foo')
    result = export_organizations_as_markdown( Organization.all.to_a )
    expect(result).to include('# markdowned')
    expect(result).to include('email@foo')
  end

  it 'exports organizations as docx' do
    create(:organization, name: 'markdowned', email: 'email@docx.com')
    result = export_organizations_as_docx( Organization.all.to_a )
    # need better expectation for docx
    expect(result).not_to be_nil
  end
end
