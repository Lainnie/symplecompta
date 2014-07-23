# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) { |n| "l.diallo#{n}.pro@gmail.com" }
  factory :user do
    email
    password 'totototo'
    factory :user_invalid do
      password ''
    end
  end
end
