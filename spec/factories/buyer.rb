FactoryBot.define do
  factory :buyer do
  email =  Faker::Internet.unique.email
  # email                       { email }
    
  end
end