FactoryBot.define do
  factory :bookmark do
    association :user, factory: :user
    association :trail, factory: :trail
  end
end
