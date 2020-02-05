require 'rails_helper'

RSpec.describe EventPolicy do
  let(:owner) { User.create }
  let(:user) { User.create }
  let(:event) {Event.create(user: owner)}

  subject { EventPolicy }

  context 'user is owner' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(owner, event) }
    end
  end

  context 'user is not owner' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, event) }
    end
  end

  context 'user not logged in' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end
end
