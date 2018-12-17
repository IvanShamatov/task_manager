# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    user
    description { 'Test description' }
    start_at { Date.today }
    end_at { 1.day.since }
  end
end
