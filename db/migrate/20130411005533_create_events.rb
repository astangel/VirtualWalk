class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :goal
      t.text :details
      t.string :logo
      t.integer :agency_id
      t.integer :sponsor_id

      t.timestamps
    end
  end
end
