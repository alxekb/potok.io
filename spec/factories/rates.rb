FactoryBot.define do
  factory :rate do
    category { "Exchange" }
    association :from_currency_id, factory: :currency, code: 800
    association :to_currency_id, factory: :currency, code: 840
    buy { 1.2 }
    sell { 0.8 }
  end
end
