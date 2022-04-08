FactoryBot.define do
  factory :property do
    address { "123 street, USA" }
    size { 1324 }
    price { 1584.12 }
    year_built { 2018 }
  end
end
