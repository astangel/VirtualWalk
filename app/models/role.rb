class Role < ActiveRecord::Base
  attr_accessible :name, :users
  validates :name, :presence => true
  
  has_and_belongs_to_many :users

end
