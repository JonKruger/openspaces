class AddTimeSlots < ActiveRecord::Migration
  def change
    TimeSlot.create :start_time => '2016-1-7 8:00am', :end_time => '2016-1-7 9:00am'
    TimeSlot.create :start_time => '2016-1-7 9:15am', :end_time => '2016-1-7 10:15am'
    TimeSlot.create :start_time => '2016-1-7 10:30am', :end_time =>'2016-1-7 11:30am'
    TimeSlot.create :start_time => '2016-1-7 11:45am', :end_time =>'2016-1-7 12:45pm'
    TimeSlot.create :start_time => '2016-1-7 1:00pm', :end_time => '2016-1-7 2:00pm'
    TimeSlot.create :start_time => '2016-1-7 2:15pm', :end_time => '2016-1-7 3:15pm'
    TimeSlot.create :start_time => '2016-1-7 3:30pm', :end_time => '2016-1-7 4:30pm'
    TimeSlot.create :start_time => '2016-1-7 4:45pm', :end_time => '2016-1-7 5:45pm'

    TimeSlot.create :start_time => '2016-1-8 8:30am', :end_time => '2016-1-8 9:30am'
    TimeSlot.create :start_time => '2016-1-8 9:45am', :end_time => '2016-1-8 10:45am'
    TimeSlot.create :start_time => '2016-1-8 11am', :end_time => '2016-1-8 12pm'
    TimeSlot.create :start_time => '2016-1-8 12:15pm', :end_time => '2016-1-8 1:15pm'
    TimeSlot.create :start_time => '2016-1-8 1:30pm', :end_time => '2016-1-8 2:30pm'
    TimeSlot.create :start_time => '2016-1-8 2:45pm', :end_time => '2016-1-8 3:45pm'
    TimeSlot.create :start_time => '2016-1-8 4pm', :end_time => '2016-1-8 5pm'
  end
end
