Bookmark.destroy_all
Coordinate.destroy_all
Trail.destroy_all
User.destroy_all

user = User.create(email: 'user@mail.com', password: 'password', name: 'Berg')

1.times do
  trail = Trail.new(
    title: 'Likya way', 
    description:'A day trek from Çirali to Adrasan is a great way to get a feeling of the Lycian way while on an otherwise relaxed holiday. The stretch has a lot to offer regarding natural sights and views! Besides, it starts at the ruins of Olympos. The trek is moderately difficult, manageable in 6-8 hours.', 
    intensity: 3, 
    extra: 'Do not miss the awesome view at the lion like mountain! You will know when you see it', 
    duration: 420,
    country: 'Turkey',
    city: 'Antalia', 
    continent: 'Europe',
    user_id: user.id
  )
  trail.coordinates.new(latitude: 36.6829, longitude: 30.5307)
  trail.coordinates.new(latitude: 36.7829, longitude: 30.6307)
  trail.coordinates.new(latitude: 36.8929, longitude: 30.7307)
  trail.coordinates.new(latitude: 36.9000, longitude: 30.8307)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/lycan_trail.png'), filename: 'lycan_trail.png')
end

1.times do
  trail = Trail.new(
    title: 'The Dingle Way', 
    description:'For those who love history and culture, some of the finest archaeological sites in Ireland can be encountered on the Dingle Way. Standing stones, ogham stones and a multitude of beehive huts are the most obvious structures to be spotted en route. Tralee and Dingle Town itself (An Daingean) are renowned cultural hubs of Ireland – it won’t take long to find some traditional music and Irish ‘craic’ in these locations.' , 
    intensity: 1, 
    extra: 'This is a lovely trail with great sights and all but dont forget to stop by the random pubs along the way.', 
    duration: 1205, 
    country: 'Ireland',
    city: 'Kerry',
    continent: 'Europe',
    user_id: user.id
  )
  trail.coordinates.new(latitude: 52.2040, longitude: -10.1329)
  trail.coordinates.new(latitude: 52.2042, longitude: -10.1245)
  trail.coordinates.new(latitude: 52.2342, longitude: -10.1220)
  trail.coordinates.new(latitude: 52.2402, longitude: -10.1200)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/dingle_trail.png'), filename: 'dingle_trail.png')
end

1.times do
  trail = Trail.new(
    title: 'Mt.Fuji, Yoshida trail', 
    description: 'An experience of a lifetime. I hiked to the summit from the Subaru Line 5th Station at 7.5k ft in about 4.5 hours. Even with poor weather toward the summit the views were amazing.Several people on my hiking bus did not summit due to altitude sickness and/or poor physical fitness.', 
    intensity: 5, 
    extra: 'Super beautiful but dont forget to buy one of those walking sticks that they sell at the climbing stations!', 
    duration: 28800, 
    country: 'Japan',
    city: 'Fuji, Hakone',
    continent: 'Asia',
    user_id: user.id
  )
  trail.coordinates.new(latitude: 35.3606, longitude: 138.7274)
  trail.coordinates.new(latitude: 35.3580, longitude: 138.7311)
  trail.coordinates.new(latitude: 35.2129, longitude: 138.4352)
  trail.coordinates.new(latitude: 35.2000, longitude: 138.4000)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/mtfuji.png'), filename: 'mtfuji.png')
end

1.times do
  trail = Trail.new(
    title: 'Inca Trail', 
    description: 'Machu Picchu is a must see when you visit Peru. it is 1 hour or so by plane outside Lima in the town of Cusco. Prepare yoursef prior to arriving Cuzco due to it is 10,950 or so feet above see level altitude that would give some people a so called mountain sickness', 
    intensity: 4, 
    extra: 'The hike was awesome but do not forget to stay atleast two extra days in cusco and you must try the local coca tea!', 
    duration: 2346, 
    country: 'Peru',
    city: 'Cusco',
    continent: 'South America',
    user_id: user.id
  )
  trail.coordinates.new(latitude: -13.1631, longitude: -72.5450)
  trail.coordinates.new(latitude: -13.170994, longitude: -72.542927)
  trail.coordinates.new(latitude: -13.173689, longitude: -72.533666)
  trail.coordinates.new(latitude: -13.192308, longitude: -72.539440)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/MachuPicchu.png'), filename: 'MachuPicchu.png')
end

1.times do
  trail = Trail.new(
    title: 'Bright Angel Trail', 
    description: 'If you have limited time in the Grand Canyon, you can’t do much better than this beautiful hike. The wide and well-maintained corridor trail offers shady rest-houses and stretches along a delightful creek. At the trailhead, the canyon beckons in all its glory.', 
    intensity: 2, 
    extra: 'If you suffer vertigo, look to the left for a while – the first five minutes are the hardest.', 
    duration: 10800, 
    country: 'United States',
    city: 'Arizona',
    continent: 'North America',
    user_id: user.id
  )
  trail.coordinates.new(latitude: 36.0565, longitude: -112.1250)
  trail.coordinates.new(latitude: 36.0675, longitude: -112.1349)
  trail.coordinates.new(latitude: 36.0788, longitude: -112.1265)
  trail.coordinates.new(latitude: 36.0965, longitude: -112.1113)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/grand_can.png'), filename: 'grand_can.png')
end

1.times do
  trail = Trail.new(
    title: 'Gunung Mugajah Trek', 
    description: 'To see an amazing view in the djungle of northern Sumatra and be amazed by the beauty of what the world has to over!', 
    intensity: 2, 
    extra: 'Remember to bring mosquito spray and hiking boots - the trek gets muddy and the mosquitos do not leave you alone!', 
    duration: 400, 
    country: 'Indonesia',
    city: 'Medan',
    continent: 'Asia',
    user_id: user.id
  )
  trail.coordinates.new(latitude: 3.44589, longitude: 98.07316)
  trail.coordinates.new(latitude: 4.193508,  longitude: 97.365763)
  trail.coordinates.new(latitude: 4.056541, longitude: 97.468545)
  trail.coordinates.new(latitude: 4.2517, longitude: 97.4208)
  trail.save
  trail.image.attach(io: File.open('spec/fixtures/Gunung.jpeg'), filename: 'Gunung.jpeg')
end
