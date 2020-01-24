FactoryBot.define do

  factory :product do
    seller_id              {"1"}
    name                   {"テスト商品"}
    discription            {"テスト用の商品です"}
    category
    brand                  {"テストブランド"}
    state                  {"新品、未使用"}
    delivery_fee           {"送料込み(出品者負担)"}
    sending_method         {"普通郵便"}
    sending_area           {"大阪府"}
    sending_day            {"1~2日で発送"}
    price                  {"1000"}
  end

end