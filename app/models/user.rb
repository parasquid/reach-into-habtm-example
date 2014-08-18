class User < ActiveRecord::Base
  has_many :memberships
  has_many :boards, through: :memberships
end
