class Brief < ActiveRecord::Base
	belongs_to :project
  has_attached_file :preview, bucket: 'designscook-assets', styles: {
		thumb: '100x100>',
		square: '200x200#',
		medium: '300x300>'
	}, default_url: '/default/no-preview.jpg', storage: :s3, url: ":s3_domain_url", path: "/projects/:id/:style.:extension",
	s3_host_name: 's3.amazonaws.com', s3_credentials: "#{Rails.root}/config/aws.yml"
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :preview, :content_type => /\Aimage\/.*\Z/
end
