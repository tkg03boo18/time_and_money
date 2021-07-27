json.extract! plan, :id, :user_id, :title, :description, :start_date, :end_date :created_at, :updated_at
json.url plan_url(plan, format: :json)
