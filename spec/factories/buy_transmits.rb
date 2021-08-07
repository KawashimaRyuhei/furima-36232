FactoryBot.define do
  factory :buy_transmit do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefectures_id { 2 }
    city { '福井市' }
    address { '花堂中' }
    building_name { 'ハイパーマンション' }
    telephone { '09012345678' }
  end
end
