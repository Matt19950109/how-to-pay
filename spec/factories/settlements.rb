FactoryBot.define do
  factory :settlement do
    payment {'PASMO'}
    association :user
    association :bank
  end
end
