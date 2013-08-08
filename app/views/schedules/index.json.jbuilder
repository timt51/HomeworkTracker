json.array!(@schedules) do |schedule|
  json.extract! schedule, :date
  json.url schedule_url(schedule, format: :json)
end
