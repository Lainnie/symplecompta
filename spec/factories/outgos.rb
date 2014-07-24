# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :outgo do
    title "resto"
    price 1234324
    user
    factory :new_attributes_outgo do
      title 'cinema'
      price 22222
    end
    factory :outgo_invalid do
      price 'asd231sd23sd213sad'
    end
  end
end
