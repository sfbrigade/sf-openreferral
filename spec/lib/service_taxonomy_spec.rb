require "spec_helper"
require "service_taxonomy"

describe ServiceTaxonomy do
  describe "#all" do
    it "returns an array of taxonomy categories" do
      taxonomy_yml = "lib/taxonomy/human_services.yml"

      services = ServiceTaxonomy.new(taxonomy_yml).all

      expect(services).
        to include("Emergency > Emergency Cash > Help Pay for Food")
    end
  end
end
