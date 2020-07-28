FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "abcd@1234" }
  end
end
