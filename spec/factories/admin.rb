FactoryGirl.define do
  factory :admin do
    email "fake@email.com"
    password "password"
    password_confirmation "password"
  end
end
