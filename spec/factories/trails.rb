FactoryBot.define do
  factory :trail do
    title {Faker::Games::ElderScrolls.region}
    description {Faker::Lorem.sentence(word_count: 16)}
    intensity {Faker::Number.between(from: 1, to: 5)}
    extra {Faker::Lorem.sentence}
    duration {Faker::Number.between(from: 10, to: 300)}
    location {Faker::Address.city} 
  end
end