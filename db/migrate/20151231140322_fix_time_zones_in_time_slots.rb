class FixTimeZonesInTimeSlots < ActiveRecord::Migration
  def change
    TimeSlot.all.each do |ts|
      ts.start_time = ts.start_time.in_time_zone('Eastern Time (US & Canada)') + 5.hours
      ts.end_time = ts.end_time.in_time_zone('Eastern Time (US & Canada)') + 5.hours
      ts.save
    end
  end
end
