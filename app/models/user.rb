class User < ActiveRecord::Base
  attr_accessible :persistence_token, :password_salt, :crypted_password, :username, :email, :last_name, :first_name, :events, :roles, :team, :activities
  
  
  has_many :events, :through => :registrations
  has_and_belongs_to_many :roles
  belongs_to :team
  has_many :activities
  
end
