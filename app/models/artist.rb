class Artist < ActiveRecord::Base
  attr_accessible :bio, :gender, :name

  validates_presence_of :name
  validates_presence_of :bio
  validates_presence_of :gender
  
  has_many :albums
end
