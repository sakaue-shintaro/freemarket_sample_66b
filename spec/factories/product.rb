FactoryBot.define do


  factory :product do
    id                    {"1"}
    seller{ FactoryBot.create(:user) }
    buyer { FactoryBot.create(:user) }
    name                  {"アクセサリー"}
    discription           {"人気商品です"}
    category
    price                 {"1000"}
    end
end