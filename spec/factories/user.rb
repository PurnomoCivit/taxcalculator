FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'tes@comc.com'
    hp '999999'
  end
end