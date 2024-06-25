FactoryBot.define do
  factory :food do
    name { 'apple' }
    measurement_unit { 'number' }
    price { 120.4 }
    quantity { 4 }
  end
  factory :test_user, class: User do
    name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    role { 'admin' }
    password { 'password@1234' }
  end
end
