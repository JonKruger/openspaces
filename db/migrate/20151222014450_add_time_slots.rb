class AddTimeSlots < ActiveRecord::Migration
  def change
    TimeSlot.create :start_time => '1/7/2016 8:00am', :end_time => '1/7/2016 9:00am'
    TimeSlot.create :start_time => '1/7/2016 9:15am', :end_time => '1/7/2016 10:15am'
    TimeSlot.create :start_time => '1/7/2016 10:30am', :end_time => '1/7/2016 11:30am'
    TimeSlot.create :start_time => '1/7/2016 11:45am', :end_time => '1/7/2016 12:45pm'
    TimeSlot.create :start_time => '1/7/2016 1:00pm', :end_time => '1/7/2016 2:00pm'
    TimeSlot.create :start_time => '1/7/2016 2:15pm', :end_time => '1/7/2016 3:15pm'
    TimeSlot.create :start_time => '1/7/2016 3:30pm', :end_time => '1/7/2016 4:30pm'
    TimeSlot.create :start_time => '1/7/2016 4:45pm', :end_time => '1/7/2016 5:45pm'

    TimeSlot.create :start_time => '1/8/2016 8:30am', :end_time => '1/8/2016 9:30am'
    TimeSlot.create :start_time => '1/8/2016 9:45am', :end_time => '1/8/2016 10:45am'
    TimeSlot.create :start_time => '1/8/2016 11am', :end_time => '1/8/2016 12pm'
    TimeSlot.create :start_time => '1/8/2016 12:15pm', :end_time => '1/8/2016 1:15pm'
    TimeSlot.create :start_time => '1/8/2016 1:30pm', :end_time => '1/8/2016 2:30pm'
    TimeSlot.create :start_time => '1/8/2016 2:45pm', :end_time => '1/8/2016 3:45pm'
    TimeSlot.create :start_time => '1/8/2016 4pm', :end_time => '1/8/2016 5pm'
  end
end
