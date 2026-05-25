require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  test "visiting the home page" do
    visit root_url
    assert_selector "body"
  end
end
