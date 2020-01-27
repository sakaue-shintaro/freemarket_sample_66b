FactoryBot.define do
  factory :seller, class: User do
    nickname                {"あーべ"}
    family_name               {"abe"}
    first_name                {"takashi"}
    j_family_name             {"アベ"}
    j_first_name              {"タカシ"}
    email           {|n|"#{n}123456@gmail.com"}
    password                {"123456"}
    phonennumber              {"080"}
    birthday_year             {"2020"}
    birthday_month            {"10"}
    birthday_day              {"31"}
  end
  factory :buyer, class: User do
    nickname                {"あーべ"}
    family_name               {"abe"}
    first_name                {"takashi"}
    j_family_name             {"アベ"}
    j_first_name              {"タカシ"}
    email           {|n|"#{n}123456@test.com"}
    password                {"n123456"}
    phonennumber              {"080"}
    birthday_year             {"2020"}
    birthday_month            {"10"}
    birthday_day              {"31"}
  end
end