Bookmark.destroy_all
Coordinates.destroy_all
Trail.destroy_all
User.destroy_all

user = User.create(email: 'user@mail.com', password: 'password', name: 'Berg')

7.times do 
  trail = Trail.create(
    title: Faker::Games::ElderScrolls.region, 
    description: Faker::Lorem.sentence(word_count: 16), 
    intensity: Faker::Number.between(from: 1, to: 5), 
    extra: Faker::Lorem.sentence, 
    duration: Faker::Number.between(from: 10, to: 300), 
    location: Faker::Address.city, 
    continent: 'Asia',
    coordinates: [{latitude: 59.291968, longitude: 18.117070}, {latitude: 59.291968, longitude: 18.117070}],
    user_id: 1
  )
  trail.image.attach(io: File.open('spec/fixtures/testimage.png'), filename: 'testimage.png')
end