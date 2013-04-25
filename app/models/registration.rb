class Registration < ActiveRecord::Base
  attr_accessible :personal_goal, :event_id, :user_id, :team_id
  
  belongs_to :user
  belongs_to :event
  belongs_to :team
end
