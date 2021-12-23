FactoryBot.define do
  factory :product, :class => Product do
    name { "product1" }
    description { "itsfirst product" }
    price {10}
  end
end
