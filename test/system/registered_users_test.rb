require "application_system_test_case"

class RegisteredUsersTest < ApplicationSystemTestCase
  setup do
    @registered_user = registered_users(:one)
  end

  test "visiting the index" do
    visit registered_users_url
    assert_selector "h1", text: "Registered Users"
  end

  test "creating a Registered user" do
    visit registered_users_url
    click_on "New Registered User"

    click_on "Create Registered user"

    assert_text "Registered user was successfully created"
    click_on "Back"
  end

  test "updating a Registered user" do
    visit registered_users_url
    click_on "Edit", match: :first

    click_on "Update Registered user"

    assert_text "Registered user was successfully updated"
    click_on "Back"
  end

  test "destroying a Registered user" do
    visit registered_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registered user was successfully destroyed"
  end
end
