json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :body, :importance, :genre
  json.start task.deadline
  json.end task.deadline

end