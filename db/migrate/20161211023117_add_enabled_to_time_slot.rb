class AddEnabledToTimeSlot < ActiveRecord::Migration[6.0]
  def change
    add_column :time_slots, :enabled, :boolean, default: true
  end
end
