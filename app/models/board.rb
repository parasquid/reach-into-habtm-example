class Board < ActiveRecord::Base
  has_many :memberships
  def role
    :admin
  end
end
