class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :destroy
  has_many :notification, dependent: :destroy
  validates :firstname, presence: true
  validates :usertype, presence: true
  has_attached_file :avatar, bucket: 'designscook-assets', styles: {
		thumb: '100x100>',
		square: '200x200#',
		medium: '300x300>'
	}, default_url: '/default/avatar.png', storage: :s3, url: ":s3_domain_url", path: "/avatars/:id/:style.:extension",
	s3_host_name: 's3.amazonaws.com', s3_credentials: "#{Rails.root}/config/aws.yml"
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
