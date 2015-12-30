class SessionHistory < ActiveRecord::Base
  self.table_name = 'session_history'
  belongs_to :session
  belongs_to :time_slot
  belongs_to :meeting_space
end
