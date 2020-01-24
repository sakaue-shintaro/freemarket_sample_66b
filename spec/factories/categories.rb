FactoryBot.define do
  factory :category do
    association :product
    name    {"アクセサリー"}
    ancestry          {""}
  end
end