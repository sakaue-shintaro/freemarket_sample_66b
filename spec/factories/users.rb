FactoryBot.define do

  factory :user do
    id                        {"1"}
    password = Faker::Internet.password(min_length: 10, max_length: 15, mix_case: true)
    
    nickname                  {"あーべ"}
    family_name               {"abe"}
    first_name                {"takashi"}
    j_family_name             {"アベ"}
    j_first_name              {"タカシ"}
    email                     {Faker::Internet.free_email}
    email                     { "katoemail@gmail.com" }
    phonennumber              {"080"}
    birthday_year             {"2020"}
    birthday_month            {"10"}
    birthday_day              {"31"}
    password                  { password }
    password_confirmation     { password }
  end

end