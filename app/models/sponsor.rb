class Sponsor < ActiveRecord::Base
  attr_accessible :name, :logo, :events
  validates :name, :presence => true
  
  has_many :events
end
