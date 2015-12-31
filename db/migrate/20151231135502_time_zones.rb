class TimeZones < ActiveRecord::Migration
  def change
    execute 'alter table time_slots alter column start_time type timestamp with time zone;'
    execute 'alter table time_slots alter column end_time type timestamp with time zone;'
  end
end
