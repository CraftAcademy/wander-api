FactoryBot.define do
  factory :trail do
    title {'MyString'}
    description {'MyText'}
    intensity { 1 }
    duration { 60 }
    location {'MyArea'} 
    extra {'Warning'}
  end
end
