require "test_helper"

class AiConversationTest < ActiveSupport::TestCase
  def setup
    @convo = ai_conversations(:alice_chat)
  end

  # --- Associations ---

  test "belongs to user (optional)" do
    assert_respond_to @convo, :user
    assert_equal users(:alice), @convo.user
  end

  test "can exist without a user" do
    convo = AiConversation.new(title: "anonymous")
    assert convo.valid?
  end

  test "has many ai_messages" do
    assert_respond_to @convo, :ai_messages
    assert_equal 3, @convo.ai_messages.count
  end

  test "destroying conversation destroys ai_messages" do
    convo = AiConversation.create!(user: users(:bob), title: "temp")
    convo.ai_messages.create!(role: "user", content: "hi")

    assert_difference "AiMessage.count", -1 do
      convo.destroy
    end
  end

  # --- recent_messages ---

  test "recent_messages returns messages ordered by created_at" do
    msgs = @convo.recent_messages
    timestamps = msgs.map(&:created_at)
    assert_equal timestamps, timestamps.sort
  end

  test "recent_messages defaults to last 6 messages" do
    convo = AiConversation.create!(title: "big chat")
    10.times { |i| convo.ai_messages.create!(role: "user", content: "msg #{i}") }

    assert_equal 6, convo.recent_messages.count
  end

  test "recent_messages accepts a custom limit" do
    convo = AiConversation.create!(title: "limited chat")
    5.times { |i| convo.ai_messages.create!(role: "user", content: "msg #{i}") }

    assert_equal 3, convo.recent_messages(3).count
  end
end
