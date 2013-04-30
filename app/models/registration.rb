class Registration < ActiveRecord::Base
  attr_accessible :personal_goal, :event_id, :user_id, :team_id, :user, :team, :event
  validates :user, :presence => true
  validates :event, :presence => true
  validates :personal_goal, :presence => true
  
  belongs_to :user
  belongs_to :event
  belongs_to :team
end
