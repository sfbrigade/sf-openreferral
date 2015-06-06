organizations = YAML.load_file("db/seeds/organizations.yml")

organizations.each do |organization_attributes|
  Organization.create(organization_attributes)
end

admins = YAML.load_file("db/seeds/admins.yml")

admins.each do |admin_attributes|
  Admin.create(admin_attributes)
end