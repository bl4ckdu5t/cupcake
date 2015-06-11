class Project < ActiveRecord::Base
	belongs_to :user
	has_one :brief, dependent: :destroy
end
