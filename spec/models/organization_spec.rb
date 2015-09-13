require "rails_helper"

describe Organization do
  describe "associations" do
    it { should belong_to(:import) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }

    context "on verification" do
      it "validates that the service belongs to the taxonomy" do
        org = create(:organization, service_list: ["not in taxonomy"])

        validity = org.validate(:verification)

        expect(validity).to be false
      end
    end
  end

  describe "#emails" do
    it "defaults to an empty list" do
      org = Organization.new

      expect(org.emails).to eq([])
    end
  end

  describe "#languages" do
    it "defaults to an empty list" do
      org = Organization.new

      expect(org.languages).to eq([])
    end
  end

  describe "#phones" do
    it "defaults to an empty list" do
      org = Organization.new

      expect(org.phones).to eq([])
    end
  end

  describe "#service_list" do
    it "defaults to an empty list" do
      org = Organization.new

      expect(org.service_list).to eq([])
    end

    it "accepts a comma-separated list of values" do
      org = Organization.new

      org.service_list = "foo,bar,baz"

      expect(org.service_list).to eq(["foo", "bar", "baz"])
    end
  end
end
