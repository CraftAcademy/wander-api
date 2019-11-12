FactoryBot.define do
  factory :trail do
    title {'MyString'}
    description {'MyText'}
    intensity { 1 }
    extra {'Warning'}
    duration { 60 }
    location {'MyArea'} 
  end
end
