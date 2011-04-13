class Genre < ActiveRecord::Base
	has_many :band_genre
	has_many :bands, :through => :band_genre
	
	validates_presence_of :name
end
