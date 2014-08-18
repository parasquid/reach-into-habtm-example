class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  def role
   return :admin if role_mask == 1
   return :member if role_mask == 4
  end
end
