class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :logo
      t.text :details

      t.timestamps
    end
  end
end
