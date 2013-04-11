class Team < ActiveRecord::Base
  attr_accessible :team_goal, :team_details, :team_name, :event, :users
  
  belongs_to :event
  has_many :users
end
