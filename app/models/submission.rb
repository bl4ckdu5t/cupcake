class Submission < ActiveRecord::Base
	belongs_to :project

  has_attached_file :preview, bucket: 'designscook-assets', styles: {
		thumb: '100x100>',
		square: '200x200#',
		medium: '300x300>'
	}, default_url: 'http://designscook.com/default/no-preview.jpg', storage: :s3, url: ":s3_domain_url",
	path: "/submissions/:id/preview/:style.:extension",
	s3_host_name: 's3.amazonaws.com', s3_credentials: "#{Rails.root}/config/aws.yml"
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :preview, :content_type => /\Aimage\/.*\Z/

	has_attached_file :project, default_url: 'http://designscook.com/default/no-preview.jpg', storage: :s3, url: ":s3_domain_url", styles: {
		thumb: '100x100#'
	}, bucket: 'designscook-assets',
	path: "/submissions/:id/attachment/:style.:extension", s3_host_name: 's3.amazonaws.com', s3_credentials: "#{Rails.root}/config/aws.yml"
	validates_attachment_content_type :project, :content_type => ["application/zip", "application/x-zip", "application/x-zip-compressed"]

	before_post_process :skip_for_zip

	def skip_for_zip
		! %w(application/zip application/x-zip).include?(project_content_type)
	end
end
