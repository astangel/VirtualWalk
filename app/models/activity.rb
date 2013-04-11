class Activity < ActiveRecord::Base
  attr_accessible :manual, :activity_date, :distance, :user, :event
  
  belongs_to :user
  belongs_to :event
end
