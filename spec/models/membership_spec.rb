require 'spec_helper'
describe Membership do
  context 'access through a user instance' do
    let(:current_user) { User.create }
    before :each do
      0.upto 10 do
        membership = current_user.memberships.create
        board = Board.create
        membership.board = board
        membership.role_mask = 1
        membership.save
      end  
    end
    it 'returns the current user\'s first board\'s role' do
      expect(current_user.boards[0].role).to eq :admin
    end
  end
end