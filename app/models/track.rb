class Track < ActiveRecord::Base
  attr_accessible :album_id, :track_list
  validates :track_list, presence: true, uniqueness: true

  belongs_to :album, :dependent => :destroy
end
