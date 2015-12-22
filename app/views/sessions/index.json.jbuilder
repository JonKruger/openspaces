json.array!(@sessions) do |session|
  json.extract! session, :id, :title, :owner, :twitter_handle, :time_slot_id, :meeting_space_id
  json.url session_url(session, format: :json)
end
