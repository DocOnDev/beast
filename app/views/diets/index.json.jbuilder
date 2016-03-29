json.array!(@diets) do |diet|
  json.extract! diet, :id, :start, :end, :description, :user_id
  json.url diet_url(diet, format: :json)
end
