class Team < ActiveRecord::Base
  attr_accessible :team_goal, :team_details, :team_name, :event, :users, :event_id, :user_ids
  validates :team_goal, :presence => true
  validates :team_name, :presence => true
  validates :team_details, :presence => true
  validates :event, :presence => true
  
  belongs_to :event
  has_many :users, :through => :registrations
  has_many :registrations
end
