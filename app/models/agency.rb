class Agency < ActiveRecord::Base
  attr_accessible :details, :logo, :name, :events
  validates :details, :presence => true
  validates :name, :presence => true

  
  has_many :events  
end
