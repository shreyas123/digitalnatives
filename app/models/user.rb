class User < ActiveRecord::Base
  attr_accessible :name

  belongs_to :role

  has_many :permission_users
  has_many :permissions, through: :permission_users
end
