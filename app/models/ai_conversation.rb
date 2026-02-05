class AiConversation < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ai_messages, dependent: :destroy

  def recent_messages(limit = 6)
    ai_messages.order(:created_at).last(limit)
  end
end
