class Post < ActiveRecord::Base
	
	mount_uploader :image, ImageUploader

	def self.search(search)
  		where("title LIKE ? OR body LIKE ? ", "%#{search}%", "%#{search}%") 
	end

end
