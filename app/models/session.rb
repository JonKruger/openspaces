class Session < ActiveRecord::Base
  belongs_to :time_slot
  belongs_to :meeting_space
end
