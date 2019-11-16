FactoryBot.define do
  factory :trail do
    title {Faker::Games::ElderScrolls.region}
    description {Faker::Lorem.sentence(word_count: 16)}
    intensity {Faker::Number.between(from: 1, to: 5)}
    extra {Faker::Lorem.sentence}
    duration {Faker::Number.between(from: 10, to: 300)}
    location {'Sörmlandsleden'} 
    latitude {59.291968}
    longitude {18.117070}
    
    association :user, factory: :user

    after(:create) do |trail|
      trail.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'testimage.png')),
      filename: 'testimage.png',
      content_type: 'image/png')
    end
  end
end