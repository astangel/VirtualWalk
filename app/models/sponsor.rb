class Sponsor < ActiveRecord::Base
  attr_accessible :name, :logo, :events
  
  has_many :events
end
