class Import < ActiveRecord::Base
  has_many :organizations

  def import
    data = open(data_url).read
    records = JSON.parse(data)
    records.each { |record| save_organization(record) }
  end

  def complete?
    organizations.any?
  end

  private

  def save_organization(org_params)
    OhanaOrganizationBuilder.new(org_params).create(import: self)
  end
end
