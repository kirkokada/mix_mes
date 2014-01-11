# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    uid 1
    provider "MyString"
    name "MyString"
  end
end
