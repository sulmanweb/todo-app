FactoryBot.define do
  factory :task do
    name { "MyString" }
    association :list
  end
end
