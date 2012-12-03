class Artist < ActiveRecord::Base
  attr_accessible :bio, :gender, :name

  validates_presence_of :name
  validates_presence_of :bio
  
  has_many :albums
end
