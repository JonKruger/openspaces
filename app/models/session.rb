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
 
  def twitter_url
  	"http://twitter.com/#{URI::encode(twitter_handle)}" if (twitter_handle && twitter_handle != "")
  end

  def owner=(value)
  	write_attribute(:owner, CGI::escapeHTML(value).html_safe)
  end

  def twitter_handle=(value)
  	write_attribute(:twitter_handle, value.nil? ? nil : value.gsub(/[^A-Za-z0-9_]/,''))
  end 
end
