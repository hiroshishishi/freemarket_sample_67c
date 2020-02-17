FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    lastname              {"ひろし"}
    firstname             {"かとう"}
    lastname_kana         {"ヒロシ"}
    firstname_kana        {"カトウ"}
    birth_year            {"1992"}
    birth_month           {"8"}
    birth_day             {"14"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    telephone             {"09000000000"}

  end

end