class Activity < ActiveRecord::Base
  attr_accessible :manual, :activity_date, :distance, :user, :event, :user_id, :event_id
  
  belongs_to :user
  belongs_to :event
end
