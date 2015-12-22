class CreateMeetingSpaces < ActiveRecord::Migration
  def change
    create_table :meeting_spaces do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
