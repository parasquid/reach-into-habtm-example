class Board < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  def role
    return :admin if role_mask == 1
    return :member if role_mask == 4
  end
end
