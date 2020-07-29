FactoryBot.define do
  factory :list do
    name { "MyString" }
    association :user
  end
end
