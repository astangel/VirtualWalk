class User < ActiveRecord::Base
  attr_accessible :persistence_token, :password_salt, :crypted_password, :password, :password_confirmation, :username, :email, :last_name, :first_name, :events, :event_ids, :roles, :team, :activities, :team_id
  
  validates :username, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  
  has_many :registrations
  has_many :events, :through => :registrations
  has_and_belongs_to_many :roles
  belongs_to :team
  has_many :activities
  
  def fullname
    first_name + " " + last_name
  end
  
  def password
    
  end
  
  def password_confirmation
    
  end
    
  
end
