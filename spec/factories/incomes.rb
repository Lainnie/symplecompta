# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :income do
    title "bar"
    price 43234
    tax 5.5
    user
    factory :new_attributes_income do
      title 'marche'
      price 131213
    end
    factory :income_invalid do
      price 'woek1o3k2o3n'
    end
  end
end
