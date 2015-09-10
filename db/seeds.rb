require "importer"

ActsAsTaggableOn::Tag.destroy_all
Admin.destroy_all
Organization.destroy_all

source = File.read("db/seeds/getting_out_staying_out.dump.txt")
importer = PlainTextImporter.new(source)
data = importer.as_json

data[:organizations].each do |org|
  Organization.create(
    name: org[:name],
    description: org[:description],
    url: org[:url],
    address: org[:address],
    phones: [org[:phone]],
    # org[:fax: null,
    emails: [org[:email]],
    # org[:miscellaneous],
    languages: org[:languages],
    # org[:what_to_bring],
    accessibility: org[:accessibility],
    fees: org[:fees],
    # org[:eligible_population],
    # org[:faith_based],
    service_list: org[:services],
  )
end

admins = YAML.load_file("db/seeds/admins.yml")

admins.each do |admin_attributes|
  Admin.create(admin_attributes)
end
