class TimeSlot < ActiveRecord::Base
  def to_s
    start_time.to_formatted_s(:day_time) + " - " + end_time.to_formatted_s(:time_ampm)
  end
end
