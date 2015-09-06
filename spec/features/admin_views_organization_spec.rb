require "rails_helper"

feature "Admin views organization" do
  scenario "admin does not see organization details initially", :js do
    admin = create(:admin)
    create(:organization)
    login_as(admin, scope: :admin)

    visit organizations_path
    expect(page).not_to have_organization_modal
    expect_persistant_url
    Percy::Capybara.snapshot(page, name: "organization list")
  end

  scenario "admin opens organization in a modal", :js do
    admin = create(:admin)
    organization = create(:organization)
    login_as(admin, scope: :admin)

    visit organizations_path
    click_on organization.name
    expect(page).to have_organization_modal(organization)
    expect_persistant_url
    Percy::Capybara.snapshot(page, name: "organization details modal")
  end

  scenario "admin hides modal", :js do
    admin = create(:admin)
    organization = create(:organization)
    login_as(admin, scope: :admin)

    visit organizations_path
    click_on organization.name
    click_on "Close"
    expect(page).not_to have_organization_modal
    expect_persistant_url
  end

  def have_organization_modal(organization = nil)
    if organization
      have_selector(".organization-modal h1", text: organization.name)
    else
      have_selector(".organization-modal")
    end
  end

  def expect_persistant_url
    initial_body = strip_formatting(page.body)
    visit current_path
    expect(strip_formatting(page.body)).to eq initial_body
  end

  def strip_formatting(html)
    html.
      gsub(/ data-.+?=".+"/, "").
      gsub(/ style="display: block; *"/, "").
      split(/(?<=>)\n?/).
      map(&:strip)
  end
end
