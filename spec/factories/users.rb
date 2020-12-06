FactoryBot.define do
  factory :user do
    name                  {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    image { File.open("#{Rails.root}/public/images/test_image.jpg") }

  end
end