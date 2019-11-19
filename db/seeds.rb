Bookmark.destroy_all
Coordinate.destroy_all
Trail.destroy_all
User.destroy_all

user = User.create(email: 'user@mail.com', password: 'password', name: 'Berg')

7.times do 
  trail = Trail.new(
    title: Faker::Games::ElderScrolls.region, 
    description: Faker::Lorem.sentence(word_count: 16), 
    intensity: Faker::Number.between(from: 1, to: 5), 
    extra: Faker::Lorem.sentence, 
    duration: Faker::Number.between(from: 10, to: 300), 
    city: Faker::Address.city, 
    country: 'Sweden'
    continent: 'Asia',
    user_id: user.id
  )
  trail.coordinates.new(latitude: 59.291968, longitude: 18.117070)
  trail.coordinates.new(latitude: 60.291968, longitude: 18.117070)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/testimage.png'), filename: 'testimage.png')
end