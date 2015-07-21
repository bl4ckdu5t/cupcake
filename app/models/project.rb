class Project < ActiveRecord::Base
	belongs_to :user
	has_one :brief, dependent: :destroy
	has_many :selections, dependent: :destroy
	has_many :submissions, dependent: :destroy
end
