Trail.destroy_all

7.times do 
  trail = Trail.create(
    title: Faker::Games::ElderScrolls.region, 
    description: Faker::Lorem.sentence(word_count: 16), 
    intensity: Faker::Number.between(from: 1, to: 5), 
    extra: Faker::Lorem.sentence, 
    duration: Faker::Number.between(from: 10, to: 300), 
    location: Faker::Address.city, 
  )
  trail.image.attach(io: File.open('spec/fixtures/testimage.png'), filename: 'testimage.png')
end