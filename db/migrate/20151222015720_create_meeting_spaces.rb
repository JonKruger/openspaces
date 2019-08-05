class CreateMeetingSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :meeting_spaces do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
