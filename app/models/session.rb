class Session < ActiveRecord::Base
  references :time_slot, :meeting_space

end
