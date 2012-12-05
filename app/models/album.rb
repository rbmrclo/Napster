class Album < ActiveRecord::Base
  attr_accessible :album_name, :date_published, :genre, :remarks

  validates :album_name, :presence => true, :length => {:maximum => 30}
  validates_presence_of :date_published
  validates_presence_of :genre
  validates_presence_of :remarks

  belongs_to :artist
  has_many :tracks, :dependent => :destroy
end
