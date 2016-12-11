class AddEnabledToTimeSlot < ActiveRecord::Migration
  def change
    add_column :time_slots, :enabled, :boolean, default: true
  end
end
