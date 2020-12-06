FactoryBot.define do
  factory :post do
    user
    title                  {Faker::Food.dish }
    body                   {Faker::Food.fruits }
    video  { File.open("#{Rails.root}/public/videos/test_image.mp4") }

  end
end