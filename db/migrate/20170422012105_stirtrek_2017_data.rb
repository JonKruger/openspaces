class Stirtrek2017Data < ActiveRecord::Migration
  def change
  	execute "update time_slots set enabled = false"

    TimeSlot.create :start_time => '2017-5-5 8:30am', :end_time => '2017-5-5 9:30am'
    TimeSlot.create :start_time => '2017-5-5 9:45am', :end_time => '2017-5-5 10:45am'
    TimeSlot.create :start_time => '2017-5-5 11:00am', :end_time => '2017-5-5 12:00pm'
    TimeSlot.create :start_time => '2017-5-5 1:00pm', :end_time => '2017-5-5 2:00pm'
    TimeSlot.create :start_time => '2017-5-5 2:15pm', :end_time => '2017-5-5 3:15pm'
    TimeSlot.create :start_time => '2017-5-5 3:30pm', :end_time => '2017-5-5 4:30pm'

  end
end
