# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :outgo do
    title "MyString"
    price 1
    user nil
  end
end
