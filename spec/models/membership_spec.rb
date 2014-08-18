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

      # associate two boards to the first user
      user1 = User.first
      user1.memberships.create(role_mask: 1, board: Board.first)
      user1.memberships.create(role_mask: 4, board: Board.last)

      # associate two boards to the second user in reverse order
      user2 = User.last
      user2.memberships.create(role_mask: 4, board: Board.first)
      user2.memberships.create(role_mask: 1, board: Board.last)
    end

    context 'first user' do
      let(:current_user) { User.first }

      it 'returns the current user\'s board\'s membership role' do
        expect(current_user.boards.first.role).to eq :admin
        expect(current_user.boards.last.role).to eq :member
      end
    end

    context 'second user' do
      let(:current_user) { User.last }

      it 'returns the current user\'s board\'s membership role' do
        expect(current_user.boards.first.role).to eq :member
        expect(current_user.boards.last.role).to eq :admin
      end
    end

  end
end