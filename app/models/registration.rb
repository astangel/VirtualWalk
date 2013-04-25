class Registration < ActiveRecord::Base
  attr_accessible :personal_goal, :event_id, :user_id, :team_id, :user, :team, :event
  
  belongs_to :user
  belongs_to :event
  belongs_to :team
end
