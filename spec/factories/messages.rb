# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    user_id 1
    mid "MyString"
    time_sent "MyString"
    body "MyText"
    sender "MyText"
  end
end
