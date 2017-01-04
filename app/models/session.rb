class Session < ActiveRecord::Base
  belongs_to :time_slot
  belongs_to :meeting_space
  validate :time_slot_must_be_enabled
  validates_presence_of :meeting_space

  def self.enabled
  	Session.joins(:time_slot).merge(TimeSlot.enabled)
  end

  def time_slot_must_be_enabled
  	if time_slot.nil? || !time_slot.enabled
  		errors.add(:time_slot, "Please select a valid time slot")
  	end
  end
end
