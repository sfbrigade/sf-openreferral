FactoryGirl.define do
  factory :organization do
    sequence(:name) { |n| "Organization #{n}" }
    description { "#{name} description" }
    address "address line"
    phones ["MyString"]
    emails ["MyString"]
    url "MyString"
    languages []
  end
end
