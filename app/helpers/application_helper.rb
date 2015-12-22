module ApplicationHelper
  def existing_session(time_slot_id, meeting_space_id)
    @sessions.select {|s| s.time_slot_id == time_slot_id && s.meeting_space_id == meeting_space_id }.first 
  end

  def existing_session_title(time_slot_id, meeting_space_id)
    session = existing_session(time_slot_id, meeting_space_id)
    session.title if session
  end

  def existing_session_owner(time_slot_id, meeting_space_id)
    session = existing_session(time_slot_id, meeting_space_id)
    session.owner if session
  end

  def existing_session_twitter_handle(time_slot_id, meeting_space_id)
    session = existing_session(time_slot_id, meeting_space_id)
    session.twitter_handle if session
  end
end
