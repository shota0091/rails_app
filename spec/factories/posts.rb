FactoryBot.define do
  factory :post do
    user
    title                  {"aaaaa"}
    body                   {"aaaaa"}
    video  { File.open("#{Rails.root}/public/videos/test_image.mp4") }

  end
end