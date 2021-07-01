
json.array!(@plans) do |plan|
  json.extract! plan, :id, :title, :description
  json.start plan.start_date
  json.end plan.end_date
  json.url plan_url(plan, format: :html)
end
