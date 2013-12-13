class UserRole < ActiveRecord::Base
	has_many :users
	serialize :permission_set
end
