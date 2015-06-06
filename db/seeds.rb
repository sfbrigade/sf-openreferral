organizations = YAML.load_file("db/seeds/organizations.yml")

organizations.each do |organization_attributes|
  Organization.create(organization_attributes)
end
