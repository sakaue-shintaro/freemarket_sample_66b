FactoryBot.define do
  factory :seller do
  email =  Faker::Internet.unique.email
    
  end
end