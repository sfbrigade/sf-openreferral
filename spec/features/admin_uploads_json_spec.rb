require "rails_helper"

feature "Uploading data" do
  scenario "uploading a JSON file" do
    data_url = "https://example.com/example.json"
    sample_upload_json_file = Rails.root + "spec/fixtures/sample_upload.json"
    body = File.read(sample_upload_json_file)
    stub_request(:get, data_url).to_return(status: 200, body: body)
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit "/"
    click_on "Import organizations"
    fill_in "Data url", with: data_url
    click_on "Start Import"

    expect(page).to have_content("30th Street Senior Center")
  end
end
