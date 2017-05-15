class User < ApplicationRecord
  extend FriendlyId

  friendly_id :username, use: [:slugged, :history]
  enum role: [:user, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos
  has_attached_file :image, :storage => :cloudinary, 
		:path => ":id/:style/:filename",
		:cloudinary_resource_type => :image, 
		styles: { thumb: "150x150>" }, 
		default_url: "/images/:style/missing.png",
		validate_media_type: false
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #using acts_as_follower to follow user model
  acts_as_follower
  acts_as_followable
end
