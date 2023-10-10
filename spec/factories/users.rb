FactoryBot.define do
  factory :user do
    nickname {'サンプル太郎'}
    email {Faker::Internet.email}
    password {'sample01'}
    password_confirmation { password }
  end
end
