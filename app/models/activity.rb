class Activity < ActiveRecord::Base
  attr_accessible :manual, :activity_date, :distance, :user, :event, :user_id, :event_id
  validates :distance, :presence => true
  validates :activity_date, :presence => true
  validates :user, :presence => true
  validates :event, :presence => true
  
  belongs_to :user
  belongs_to :event
end
