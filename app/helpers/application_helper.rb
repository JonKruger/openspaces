require 'open-uri'

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
    str= ""
    if session
      str << "<a href='http://twitter.com/#{URI::encode(session.twitter_handle)}' target='openspacetwitter'>" if (session && session.twitter_handle && session.twitter_handle != "")
      str << CGI::escapeHTML(session.owner)
      str << "</a>" if (session && session.twitter_handle && session.twitter_handle != "")
    end
    str.html_safe
  end

  def existing_session_twitter_link(time_slot_id, meeting_space_id)
    session = existing_session(time_slot_id, meeting_space_id)
  end

  def auto_refresh_interval
    seconds = nil
    if params['auto-refresh']
      seconds = params['auto-refresh'].to_i
    end

    seconds = 30 if (seconds && seconds < 30)
    return seconds * 1000 if seconds
  end

  def show_past_sessions?
    (params['show-past-sessions'] && params['show-past-sessions'].to_i == 0) ? false : true
  end

  def show_create_links?
    (params['show-create-links'] && params['show-create-links'].to_i == 0) ? false : true
  end

  def is_time_slot_in_past?(time_slot)
    time_slot.end_time < Time.now - 5.minutes
  end
end
