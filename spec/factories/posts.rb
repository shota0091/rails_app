FactoryBot.define do
  factory :post do
    video             { Faker::Internet.name }
    title             {"あああああ"}
    body              {"ああああああああ"}
  end
end