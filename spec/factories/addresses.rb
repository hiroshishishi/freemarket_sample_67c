FactoryBot.define do

  factory :address do
    lastname              {"博士"}
    firstname             {"加藤"}
    lastname_kana         {"ヒロシ"}
    firstname_kana        {"カトウ"}
    zip_code              {"496-0044"}
    prefecture_id         {47}
    city                  {"tusima"}
    street                {"4-115"}
    user_id               {1}
  end
end