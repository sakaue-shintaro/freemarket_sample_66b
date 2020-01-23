FactoryBot.define do
  factory :seller do
  email =  Faker::Internet.unique.email
  # email           { email }
    
  end
end