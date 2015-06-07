class OhanaOrganizationBuilder
  def initialize(data)
    @data = data
  end

  def build
    Organization.new(sanitized_attributes)
  end

  def create(attributes = {})
    Organization.create(sanitized_attributes.merge(attributes))
  end

  private

  def sanitized_attributes
    data.transform_keys(&:to_s).slice("name")
  end

  attr_reader :data
end
