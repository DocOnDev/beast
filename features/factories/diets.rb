FactoryGirl.define do
  factory :diet do
    start_date 2.days.ago
    end_date 5.days.until
    description "Factory description for Active Diet"
  end
end
