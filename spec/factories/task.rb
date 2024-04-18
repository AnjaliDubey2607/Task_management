# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { 'Task Title' }
    description { 'Task Description' }
  end
end
