class Artist < ActiveRecord::Base
  attr_accessible :bio, :gender, :name
  validates :name, :presence => true, :length => {:maximum => 30}
  validates_presence_of :bio
  
  has_many :albums, :dependent => :destroy

end
