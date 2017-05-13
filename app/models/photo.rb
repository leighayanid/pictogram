class Photo < ApplicationRecord
	extend FriendlyId

	friendly_id :title, use: :slugged
	
	acts_as_votable
	belongs_to :user
	has_attached_file :image, :storage => :cloudinary, 
		:path => ":id/:style/:filename",
		:cloudinary_resource_type => :image, 
		styles: { medium: "300x300>", thumb: "100x100>" }, 
		default_url: "/images/:style/missing.png",
		validate_media_type: false
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
