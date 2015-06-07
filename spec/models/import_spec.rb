require "rails_helper"

describe Import do
  describe "associations" do
    it { should have_many(:organizations) }
  end
end
