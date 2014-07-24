# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :income do
    title "MyString"
    price 1
    tax 1.5
    user nil
  end
end
