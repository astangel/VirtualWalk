class Event < ActiveRecord::Base
  attr_accessible :logo, :details, :goal, :end_date, :start_date, :event_name, :teams, :activities, :users, :agency, :sponsor
  
  has_many :teams
  has_many :activities
  has_many :users, :through => :registrations
  belongs_to :agency
  belongs_to :sponsor  
end
