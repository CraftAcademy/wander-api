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
    location: Faker::Address.city, 
    continent: 'Asia',
    user_id: user.id
  )
  trail.coordinates.new(latitude: 59.291968, longitude: 18.117070)
  trail.coordinates.new(latitude: 60.291968, longitude: 18.117070)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/testimage.png'), filename: 'testimage.png')
end


1.times do
  trail_1 = Trail.new(
    title: 'Likya way', 
    description:'A day trek from Çirali to Adrasan is a great way to get a feeling of the Lycian way while on an otherwise relaxed holiday. The stretch has a lot to offer regarding natural sights and views! Besides, it starts at the ruins of Olympos. The trek is moderately difficult, manageable in 6-8 hours.' , 
    intensity: 3, 
    extra: 'Do not miss the awesome view at the lion like mountain! You will know when you see it', 
    duration: 420,
    country: 'Turkey',
    city: 'Antalia', 
    continent: 'europe',
    user_id: user.id
  )
  trail.coordinates.new(latitude: 36.6829, longitude: 30.5307)
  trail.coordinates.new(latitude: 36.8829, longitude: 30.7307)
  trail.coordinates.new(latitude: 36.9929, longitude: 30.3307)
  trail.coordinates.new(latitude: 37.0000, longitude: 30.9307)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/lycan_trail.png'), filename: 'lycan_trail.png')
end

1.times do
  trail_2 = Trail.new(
    title: 'The Dingle Way', 
    description:'For those who love history and culture, some of the finest archaeological sites in Ireland can be encountered on the Dingle Way. Standing stones, ogham stones and a multitude of beehive huts are the most obvious structures to be spotted en route. Tralee and Dingle Town itself (An Daingean) are renowned cultural hubs of Ireland – it won’t take long to find some traditional music and Irish ‘craic’ in these locations.' , 
    intensity: 1, 
    extra: 'This is a lovely trail with great sights and all but dont forget to stop by the random pubs along the way.', 
    duration: 505, 
    country: 'Ireland',
    city: 'Kerry',
    continent: 'europe',
    user_id: user.id
  )
  trail.coordinates.new(latitude: 52.2040, longitude: -10.1329)
  trail.coordinates.new(latitude: 52.2042, longitude: -10.1245)
  trail.coordinates.new(latitude: 52.2342, longitude: -10.1220)
  trail.coordinates.new(latitude: 52.2402, longitude: -10.1200)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/PUT PNG HERE.png'), filename: 'PUT ITS NAME HERE.png')
end
