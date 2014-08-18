class User < ActiveRecord::Base
  has_many :memberships
  has_many :boards, through: :memberships, :select => 'memberships.role_mask as role_mask'
end
