class Agency < ActiveRecord::Base
  attr_accessible :details, :logo, :name, :events
  
  has_many :events  
end
