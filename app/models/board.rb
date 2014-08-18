class Board < ActiveRecord::Base
  has_many :memberships
  def role
    memberships.first.role
  end
end
