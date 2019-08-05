class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :title, required: true
      t.string :owner, required: true
      t.string :twitter_handle
      t.references :time_slot, index: true, foreign_key: true, required: true
      t.references :meeting_space, index: true, foreign_key: true, required: true

      t.timestamps null: false
    end
  end
end
