class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :event_type
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
