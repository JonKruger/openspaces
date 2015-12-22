json.array!(@sessions) do |session|
  json.extract! session, :id, :title, :owner, :twitter_handle
  json.url session_url(session, format: :json)
end
