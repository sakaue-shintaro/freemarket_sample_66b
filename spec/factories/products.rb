FactoryBot.define do
  factory :product, class: Product do
    seller                
    buyer                 
    name                  {"アクセサリー"}
    discription           {"人気商品です"}
    category              
    brand                 {"ナイキ"}
    state                 {"人気商品です"}
    delivery_fee          {"300"}
    sending_method        {"未定"}
    sending_area          {"愛知"}
    sending_day           {"三日"}
    price                 {"1000"}
  end
end