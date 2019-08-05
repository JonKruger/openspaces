class SessionHistory < ActiveRecord::Migration[6.0]
  def change
    create_table :session_history do |t|
      t.references :session, required: true
      t.string :title, required: true
      t.string :owner, required: true
      t.string :twitter_handle
      t.references :time_slot, index: true, foreign_key: true, required: true
      t.references :meeting_space, index: true, foreign_key: true, required: true
      t.string :operation, required: true, length: 1
      t.datetime :action_date, required: true

      t.timestamps null: false
    end
  end
end
