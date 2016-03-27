json.array!(@entries) do |entry|
  json.extract! entry, :id, :food_group_id, :username, :date, :portion, :description
  json.url entry_url(entry, format: :json)
end
