# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user

  validates :description, :start_at, :end_at, presence: true
  validate :start_end_order, if: -> { start_at && end_at }

  private

  def start_end_order
    errors.add(:start_at, "can't be greater than end_at") if start_at > end_at
  end
end
