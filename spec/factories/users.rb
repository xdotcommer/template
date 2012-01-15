# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name                    "Mike Cowden"
    email                   "mikecowden@example.com"
    password                "password"
    password_confirmation   "password"
  end
end