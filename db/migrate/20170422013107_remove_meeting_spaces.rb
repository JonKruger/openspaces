class RemoveMeetingSpaces < ActiveRecord::Migration
  def change
  	execute "delete from meeting_spaces where name in ('5 (TV)', '6 (TV)', '7', '8');"
  end
end
