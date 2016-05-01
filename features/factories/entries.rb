FactoryGirl.define do
  factory :entry do
    user_id 1
    food_group
    date Time.zone.now.to_date
    description "Factory entry description"
    portion 5
  end
end
