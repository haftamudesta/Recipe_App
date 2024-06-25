FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    role { 'admin' }
    password { 'password@1234' }
  end
end
