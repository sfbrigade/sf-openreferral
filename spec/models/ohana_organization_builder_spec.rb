require "rails_helper"

describe OhanaOrganizationBuilder do
  it "works when keys are symbols" do
    data = { name: "Example Organization" }
    builder = OhanaOrganizationBuilder.new(data)

    organization = builder.build

    expect(organization).to be_valid
  end

  it "works when keys are strings" do
    data = { "name" => "Example Organization" }
    builder = OhanaOrganizationBuilder.new(data)

    organization = builder.build

    expect(organization).to be_valid
  end

  it "sets the org name from the data" do
    data = { name: "Example Organization" }
    builder = OhanaOrganizationBuilder.new(data)

    organization = builder.build

    expect(organization.name).to eq(data[:name])
  end

  it "sets status to pending" do
    data = { name: "Example Organization" }
    builder = OhanaOrganizationBuilder.new(data)

    organization = builder.build

    expect(organization.status).to eq("pending")
  end

  it "sets the org description from the first location"
  it "sets languages from the first location"
  it "sets phone numbers from the first location"
  it "sets addresses from all locations"
  it "sets emails from the first location"
end
