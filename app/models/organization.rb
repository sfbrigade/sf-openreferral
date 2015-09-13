require "service_taxonomy"

class Organization < ActiveRecord::Base
  acts_as_taggable_on :services
  belongs_to :import

  validates :name, presence: true

  validate :belongs_to_service_taxonomy, on: :verification

  def valid_status
    if valid?(:verification)
      :valid
    else
      :invalid
    end
  end

  def belongs_to_service_taxonomy
    taxonomy = ServiceTaxonomy.new("lib/taxonomy/human_services.yml").all

    has_valid_service = service_list.any? do |service|
      taxonomy.include?(service)
    end

    unless has_valid_service
      errors.add(:services, "must include one of the standard categories")
    end
  end
end
