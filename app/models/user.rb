class User < ActiveRecord::Base
  attr_accessible :persistence_token, :password_salt, :crypted_password, :password, :password_confirmation, :username, :email, :last_name, :first_name, :events, :event_ids, :roles, :role_ids, :teams, :activities, :team_id
  acts_as_authentic
  
  validates :username, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  
  has_many :registrations
  has_many :events, :through => :registrations
  has_and_belongs_to_many :roles
  has_many :teams, :through => :registrations
  has_many :activities
  
  def fullname
    first_name + " " + last_name
  end
  
  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym}
  end
  
  before_create :setup_default_role_for_new_users
 
  def setup_default_role_for_new_users    
      self.roles << Role.where("name='participant'")
  end
    
  
end
