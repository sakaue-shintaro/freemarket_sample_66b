FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(8)
    email = Faker::Internet.unique.email
    nickname                  {"あーべ"}
    family_name               {"abe"}
    first_name                {"takashi"}
    j_family_name             {"アベ"}
    j_first_name              {"タカシ"}
    email                     { email }
    phonennumber              {"00000000"}
    birthday_year             {"00000000"}
    birthday_month            {"00000000"}
    birthday_day              {"00000000"}
    password                  { password }
    password_confirmation     { password }
  end

end




# FactoryBot.define do
#   factory :user do
#     password = Faker::Internet.password(8)
#     email   {Faker::Internet.unique.email}
#     nickname                  {“あーべ“}
#     family_name               {“abe”}
#     first_name                {“takashi”}
#     j_family_name             {“アベ“}
#     j_first_name              {“タカシ“}
#     # email                     { email }
#     phonennumber              {“00000000”}
#     birthday_year             {“00000000"}
#     birthday_month            {“00000000”}
#     birthday_day              {“00000000"}
#     password                  { password }
#     password_confirmation     { password }
#   end
# end