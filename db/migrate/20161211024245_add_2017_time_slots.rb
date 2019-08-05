class Add2017TimeSlots < ActiveRecord::Migration[6.0]
  def change
  	execute "update time_slots set enabled = false where start_time < '2017-1-1'"

    TimeSlot.create :start_time => '2017-1-12 8:00am', :end_time => '2017-1-12 9:00am'
    TimeSlot.create :start_time => '2017-1-12 9:15am', :end_time => '2017-1-12 10:15am'
    TimeSlot.create :start_time => '2017-1-12 10:30am', :end_time =>'2017-1-12 11:30am'
    TimeSlot.create :start_time => '2017-1-12 11:45am', :end_time =>'2017-1-12 12:45pm'
    TimeSlot.create :start_time => '2017-1-12 1:00pm', :end_time => '2017-1-12 2:00pm'
    TimeSlot.create :start_time => '2017-1-12 2:15pm', :end_time => '2017-1-12 3:15pm'
    TimeSlot.create :start_time => '2017-1-12 3:30pm', :end_time => '2017-1-12 4:30pm'
    TimeSlot.create :start_time => '2017-1-12 4:45pm', :end_time => '2017-1-12 5:45pm'

    TimeSlot.create :start_time => '2017-1-13 8:30am', :end_time => '2017-1-13 9:30am'
    TimeSlot.create :start_time => '2017-1-13 9:45am', :end_time => '2017-1-13 10:45am'
    TimeSlot.create :start_time => '2017-1-13 11am', :end_time => '2017-1-13 12pm'
    TimeSlot.create :start_time => '2017-1-13 12:15pm', :end_time => '2017-1-13 1:15pm'
    TimeSlot.create :start_time => '2017-1-13 1:30pm', :end_time => '2017-1-13 2:30pm'
    TimeSlot.create :start_time => '2017-1-13 2:45pm', :end_time => '2017-1-13 3:45pm'
    TimeSlot.create :start_time => '2017-1-13 4pm', :end_time => '2017-1-13 5pm'
  end
end
