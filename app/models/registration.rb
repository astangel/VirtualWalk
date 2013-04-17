class Registration < ActiveRecord::Base
  attr_accessible :personal_goal, :event_id, :user_id  
  
  belongs_to :user
  belongs_to :event
end
