json.array!(@food_groups) do |food_group|
  json.extract! food_group, :id, :name, :description, :calories
  json.url food_group_url(food_group, format: :json)
end
