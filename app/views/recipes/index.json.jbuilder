json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :description, :web_page, :quantity, :unit
  json.url recipe_url(recipe, format: :json)
end
