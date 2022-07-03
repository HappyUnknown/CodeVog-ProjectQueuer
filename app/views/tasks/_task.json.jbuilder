json.extract! task, :id, :Topic, :Description, :StartDate, :ExpireDate, :Type, :Priority, :Comments, :ExecutorUID, :AuthorUID, :ProjectID, :created_at, :updated_at
json.url task_url(task, format: :json)
