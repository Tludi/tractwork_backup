json.array!(@workdays) do |workday|
  json.extract! workday, :id, :user_id, :project_id, :dayDate, :hoursWorked, :notes
  json.url workday_url(workday, format: :json)
end
