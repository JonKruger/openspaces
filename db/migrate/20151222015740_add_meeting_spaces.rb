class AddMeetingSpaces < ActiveRecord::Migration
  def change
    MeetingSpace.create :name => '1'
    MeetingSpace.create :name => '2'
    MeetingSpace.create :name => '3'
    MeetingSpace.create :name => '4'
    MeetingSpace.create :name => '5 (TV)'
    MeetingSpace.create :name => '6 (TV)'
    MeetingSpace.create :name => '7'
    MeetingSpace.create :name => '8'
  end
end
