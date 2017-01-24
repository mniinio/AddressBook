FactoryGirl.define do
  factory :user do
    id 1
    email { Faker::Internet.email }
    password 'ihanmitavaan'
    password_confirmation 'ihanmitavaan'
    confirmed_at Date.today
  end
end