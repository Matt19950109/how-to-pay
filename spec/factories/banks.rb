FactoryBot.define do
  factory :bank do
    amount_price { 50000 }
    name {'三井住友UFJ銀行'}
    association :user
  end
end
