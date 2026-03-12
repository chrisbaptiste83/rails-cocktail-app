require "test_helper"

class AiMessageTest < ActiveSupport::TestCase
  def setup
    @message = ai_messages(:user_prompt)
  end

  # --- Constants ---

  test "ROLES includes user, assistant, and system" do
    assert_includes AiMessage::ROLES, "user"
    assert_includes AiMessage::ROLES, "assistant"
    assert_includes AiMessage::ROLES, "system"
  end

  # --- Validations ---

  test "valid message is valid" do
    assert @message.valid?
  end

  test "role is required" do
    @message.role = nil
    assert_not @message.valid?
    assert_includes @message.errors[:role], "can't be blank"
  end

  test "role must be an accepted value" do
    @message.role = "bartender"
    assert_not @message.valid?
    assert_includes @message.errors[:role], "is not included in the list"
  end

  test "content is required" do
    @message.content = nil
    assert_not @message.valid?
    assert_includes @message.errors[:content], "can't be blank"
  end

  # --- Associations ---

  test "belongs to ai_conversation" do
    assert_respond_to @message, :ai_conversation
    assert_equal ai_conversations(:alice_chat), @message.ai_conversation
  end

  # --- All three roles are accepted ---

  AiMessage::ROLES.each do |valid_role|
    test "#{valid_role} is a valid role" do
      msg = AiMessage.new(
        ai_conversation: ai_conversations(:alice_chat),
        role: valid_role,
        content: "test content"
      )
      assert msg.valid?, "Expected role '#{valid_role}' to be valid"
    end
  end
end
