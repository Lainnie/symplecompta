# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) { |n| "l.diallo#{n}.pro@gmail.com" }
  factory :user do
    email
    password 'totototo'
    factory :user_invalid do
      password ''
    end
    factory :user_deal do
      ignore do
        deal 4
      end

      after(:create) do |user, ev|
        FactoryGirl.create_list(:income, ev.deal, user: user)
        FactoryGirl.create_list(:outgo, ev.deal, user: user)
      end
    end
  end
end
