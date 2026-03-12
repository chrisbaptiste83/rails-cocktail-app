require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:alice)
  end

  # --- Validations ---

  test "valid user is valid" do
    assert @user.valid?
  end

  test "username is required" do
    @user.username = nil
    assert_not @user.valid?
    assert_includes @user.errors[:username], "can't be blank"
  end

  test "username must be unique" do
    duplicate = User.new(
      username: @user.username,
      email: "other@example.com",
      password: "password123"
    )
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:username], "has already been taken"
  end

  test "email is required" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "email must be unique" do
    duplicate = User.new(
      username: "charlie",
      email: @user.email,
      password: "password123"
    )
    assert_not duplicate.valid?
  end

  # --- Associations ---

  test "has many cocktail_recipes" do
    assert_respond_to @user, :cocktail_recipes
  end

  test "has many comments" do
    assert_respond_to @user, :comments
  end

  test "has many ingredients through cocktail_recipes" do
    assert_respond_to @user, :ingredients
  end

  test "has many ai_conversations" do
    assert_respond_to @user, :ai_conversations
  end

  test "destroying user destroys ai_conversations" do
    user = User.create!(username: "temp_user", email: "temp@example.com", password: "password123")
    convo = AiConversation.create!(user: user)
    convo.ai_messages.create!(role: "user", content: "hello")

    assert_difference "AiConversation.count", -1 do
      user.destroy
    end
  end
end
