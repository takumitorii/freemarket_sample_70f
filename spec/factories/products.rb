FactoryBot.define do
  factory :user do
    nickname          {"sato"}
    email             {"kkk@gmail.com"}
    password          {"00000000"}
    encrypted_password{"00000000"}
    family_name       {"sato"}
    first_name        {"kenta"}
    family_name_kana  {"sato"}
    first_name_kana   {"kenta"}
    birth_day         {"1990-08-24"}
  end

  factory :category do
    name              {"aaa"}
  end

  factory :product do
    name              {"abe"}
    price             {111}
    description       {"aaa"}
    status            {"aaa"}
    size              {"aaa"}
    days              {"aaa"}
    cost              {"aaa"}
    prefecture_id     {1}
    category_id       {1}
    user_id           {1}
  end

end