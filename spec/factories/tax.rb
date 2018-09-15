FactoryBot.define do
  factory :tax do
    name { Faker::StarWars.character }
    tax_code { Faker::Number.number(5) }
    amount { Faker::Number.number(5) }
    user_id nil
  end
end