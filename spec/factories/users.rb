FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    image_url { "https://fastly.picsum.photos/id/1055/128/128.jpg?hmac=GtvhCcq2Gk2_bJLR63yn7WBZNGwUT2xRXZJcm-WUrP0" }
  end
end
