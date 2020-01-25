FactoryBot.define do
  factory :product do
    seller                { FactoryBot.create(:user) }
    seller                {"1"}
    seller                {""}
    buyer                 {""}
    name                  {"アクセサリー"}
    discription           {"人気商品です"}
    category              { FactoryBot.create(:category) }
    brand                 {"ナイキ"}
    state                 {"人気商品です"}
    delivery_fee          {"300"}
    sending_method        {"未定"}
    sending_area          {"愛知"}
    sending_day           {"三日"}
    price                 {"1000"}
  end
end