FactoryBot.define do
  factory :item do
    name             {Faker::Lorem.word} 
    text             {Faker::Lorem.sentence}
    category_id      {Faker::Number.between(from:2, to: 11)}
    delivery_fee_id  {Faker::Number.between(from:2, to: 3)}
    prefectures_id   {Faker::Number.between(from:2, to: 48)}
    status_id        {Faker::Number.between(from:2, to: 7)}
    shipment_day_id  {Faker::Number.between(from:2, to:4)}
    price            {Faker::Number.between(from:300, to:9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end  
end