class PermissionUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :permission
  # attr_accessible :title, :body
end
