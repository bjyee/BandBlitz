class Band < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
	mount_uploader :song, SongUploader
	
	has_many :band_genre
	has_many :genres, :through => :band_genre
	
	validates_presence_of :name
end
