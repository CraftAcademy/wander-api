FactoryBot.define do
  factory :coordinate, class: 'Coordinates' do
    trail { nil }
    data {latitude: 59.291968, longitude: 18.117070},{latitude: 59.311968, longitude: 18.137070}
  end
end