class AddTeamIdToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :team_id, :integer
  end
end
