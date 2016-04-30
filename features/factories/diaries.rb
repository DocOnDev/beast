FactoryGirl.define do
  factory :diary do
    user_id 1
    date Time.zone.now.to_date
    narrative "Factory narrative"
  end
end
