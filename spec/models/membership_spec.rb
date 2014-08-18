require 'spec_helper'

MAX_USERS = 2
MAX_BOARDS = 5

describe Membership do
  context 'access through a user instance' do
    before :each do
      1.upto MAX_USERS do
        User.create
      end

      1.upto MAX_BOARDS do
        Board.create
      end

      # associate two boards to the current user
      user = User.first
      user.memberships.create(role_mask: 1, board: Board.first)
      user.memberships.create(role_mask: 4, board: Board.last)
    end
    let(:current_user) { User.first }

    it 'returns the current user\'s board\'s membership role' do
      expect(current_user.boards.first.role).to eq :admin
      expect(current_user.boards.last.role).to eq :member
    end
  end
end