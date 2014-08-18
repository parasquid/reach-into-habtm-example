class Board < ActiveRecord::Base
  has_many :memberships
  def role(user)
    memberships.where(user: user, board: self).first.role
  end
end
