FactoryBot.define do

  factory :item do
    title                {"バッグ"}
    text                 {"美品です。"}
    category             {create(:category)}
    brand                {"シャネル"}
    condition_id         {4}
    fee_id               {1}
    prefecture_id        {5}
    deliveryday_id       {2}
    price                {888}
    seller_id            {create(:user).id}
    buyer_id             {0}
  end

end