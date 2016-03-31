json.array!(@diaries) do |diary|
  json.extract! diary, :id, :date, :narrative, :sleep_score, :body_weight, :step_count
  json.url diary_url(diary, format: :json)
end
