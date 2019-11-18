FactoryBot.define do
  factory :trail_coordinate, class: 'TrailCoordinates' do
    trail { nil }
    data { [{latitude: 59.291968, longitude: 18.117070},{latitude: 59.311968, longitude: 18.137070}] }
  end
end
