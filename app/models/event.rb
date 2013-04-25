class Event < ActiveRecord::Base
  attr_accessible :logo, :details, :goal, :end_date, :start_date, :event_name, :teams, :activities, :users, :agency, :sponsor, :agency_id, :sponsor_id
  validates :details, :presence => true
  validates :end_date, :presence => true
  validates :start_date, :presence => true
  validates :event_name, :presence => true
  validates :goal, :presence => true
  validates :sponsor, :presence => true
  validates :agency, :presence => true

  
  has_many :teams
  has_many :activities
  has_many :registrations
  has_many :users, :through => :registrations
  belongs_to :agency
  belongs_to :sponsor
  
  def date_range
    str = ""
    if (start_date.year == end_date.year) and (start_date.month == end_date.month)
      str = "#{start_date.strftime("%B")} #{start_date.day} - #{end_date.day}, #{start_date.year}"
    elsif (start_date.year == end_date.year)
      str = "#{start_date.strftime("%B")} #{start_date.day} - #{end_date.strftime("%B")} #{end_date.day}, #{start_date.year}"
    else 
     str = "#{start_date.strftime("%B %d %Y")} - #{end_date.strftime("%B %d %Y")}"
    end
    str
  end
end
