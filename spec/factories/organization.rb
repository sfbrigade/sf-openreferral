FactoryGirl.define do
  factory :organization do
    sequence(:name) { |n| "Organization #{n}" }
    description { "#{name} description" }
    address "address line"
    phone "MyString"
    email "MyString"
    url "MyString"
  end
end
