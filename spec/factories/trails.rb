FactoryBot.define do
  factory :trail do
    title {'MyString'}
    description {'My very long description'}
    intensity { 1 }
    extra {'Warning'}
    duration { 60 }
    location {'MyArea'} 
  end
end
