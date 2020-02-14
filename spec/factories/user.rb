FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length: 6)
    nickname                {"バッグ"}
    lastname                {"田中"}
    firstname               {"太郎"}
    lastname_kana           {"タナカ"}
    firstname_kana          {"タロウ"}
    birth_year              {2000}
    birth_month             {12}
    birth_day               {31}
    password                {password}
    password_confirmation   {password}
    email                   {Faker::Internet.free_email}
    telephone               {"00000000000"}
  end

end