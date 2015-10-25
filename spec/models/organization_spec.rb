require "rails_helper"

describe Organization do
  describe "validations" do
    it { should validate_presence_of(:name) }
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
end
