FactoryGirl.define do
  factory :food_group do
    name "Generic Food Group"
    description "Generic from the Factory"
    calories 10
  end

  factory :protein, class: FoodGroup do
    name "Protein"
    description "Protein from the Factory"
    calories 100
  end

  factory :vegetable, class: FoodGroup do
    name "Veggies"
    description "Veggies from the Factory"
    calories 5
  end
end
