class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :title
      t.string :owner
      t.string :twitter_handle
      t.references :time_slot, :foreign_key => true
      t.references :meeting_space, :foreign_key => true

      t.timestamps null: false
    end
  end
end
