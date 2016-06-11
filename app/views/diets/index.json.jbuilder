json.array!(@diets) do |diet|
  json.extract! diet, :id, :start_date, :end_date, :description, :user_id
  json.url diet_url(diet, format: :json)
end
