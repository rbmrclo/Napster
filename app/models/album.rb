class Album < ActiveRecord::Base
  attr_accessible :album_name, :date_published, :genre, :remarks

  validates_presence_of :album_name
  validates_presence_of :date_published
  validates_presence_of :genre
  validates_presence_of :remarks

  belongs_to :artist, :dependent => :destroy
end
