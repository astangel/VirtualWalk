class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.text :team_details
      t.integer :team_goal
      t.integer :event_id

      t.timestamps
    end
  end
end
