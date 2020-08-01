FactoryBot.define do
  factory :task do
    name { "MyString" }
    done { false }
    association :list
  end
end
