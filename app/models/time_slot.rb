class TimeSlot < ActiveRecord::Base
#  def self.time_zone_aware_attributes
#    false
#  end

  def to_s
    start_time.to_formatted_s(:day_time) + " - " + end_time.to_formatted_s(:time_ampm)
  end
end
