json.array!(@assignments) do |assignment|
  json.extract! assignment, :title, :description, :image_url, :due_date
  json.url assignment_url(assignment, format: :json)
end
