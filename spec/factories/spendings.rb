FactoryBot.define do
  factory :spending do
    price {5000}
    item_name {'食費'}
    category_id {1}
    start_time {1}
    association :user
    association :settlement

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/huzi.jpg'), filename: 'huzi.jpg')
    end
  end
end
