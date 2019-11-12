FactoryBot.define do
  factory :trail do
    title {'MyString'}
    description {'My very long description'}
    intensity { 1 }
    extra {'Warning'}
    duration { 60 }
    location {'MyArea'} 

    after(:create) do |trail|
      trail.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'testimage.png')),
      filename: 'testimage.png',
      content_type: 'image/png')
    end
  end
end