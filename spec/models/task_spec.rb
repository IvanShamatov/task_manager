require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { build(:task) }

  describe 'validations' do
    it { is_expected.to be_valid }

    context 'with no description' do
      subject { build(:task, description: nil) }
      it { is_expected.to be_invalid }
    end

    context 'with no start_at' do
      subject { build(:task, start_at: nil) }
      it { is_expected.to be_invalid }
    end

    context 'with no end_at' do
      subject { build(:task, end_at: nil) }
      it { is_expected.to be_invalid }
    end

    context 'check start/end order' do
      subject { build(:task, end_at: 1.day.ago) }
      it {
        subject.valid?
        expect(subject.errors.messages).to include(start_at: ['can\'t be greater than end_at'])
      }
    end
  end

  describe 'associations' do
    context 'with no user' do
      subject { build(:task, user: nil) }
      it { is_expected.to be_invalid }
    end
  end
end
