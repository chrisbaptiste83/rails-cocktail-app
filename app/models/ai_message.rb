class AiMessage < ApplicationRecord
  ROLES = %w[user assistant system].freeze

  belongs_to :ai_conversation

  validates :role, presence: true, inclusion: { in: ROLES }
  validates :content, presence: true
end
