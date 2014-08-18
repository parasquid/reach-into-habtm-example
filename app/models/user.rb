class User < ActiveRecord::Base
  has_many :memberships
  has_many :boards, through: :memberships, :select => 'boards.*, memberships.role_mask as role_mask'
end
