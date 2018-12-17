require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it { is_expected.to be_valid }

    context 'with no password' do
      subject { build(:user, password: nil) }
      it { is_expected.to be_invalid }
    end

    context 'with no email' do
      subject { build(:user, email: nil) }
      it { is_expected.to be_invalid }
    end

    context 'with invalid email' do
      subject { build(:user, email: 'sometext') }
      it { is_expected.to be_invalid }
    end

    context 'with same email' do
      subject do
        user = create(:user)
        build(:user, email: user.email)
      end
      it { is_expected.to be_invalid }
    end
  end
end
