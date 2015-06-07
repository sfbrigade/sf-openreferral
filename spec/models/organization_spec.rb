require "rails_helper"

describe Organization do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "array values" do
    it "defaults to an empty array" do
      org = Organization.create(name: "example")

      expect(org.emails).to eq([])
      expect(org.languages).to eq([])
      expect(org.phones).to eq([])
    end
  end
end
