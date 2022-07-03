json.extract! log, :id, :DateRecieved, :DateFinished, :Comment, :TaskID, :created_at, :updated_at
json.url log_url(log, format: :json)
