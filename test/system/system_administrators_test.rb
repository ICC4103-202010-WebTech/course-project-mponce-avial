require "application_system_test_case"

class SystemAdministratorsTest < ApplicationSystemTestCase
  setup do
    @system_administrator = system_administrators(:one)
  end

  test "visiting the index" do
    visit system_administrators_url
    assert_selector "h1", text: "System Administrators"
  end

  test "creating a System administrator" do
    visit system_administrators_url
    click_on "New System Administrator"

    click_on "Create System administrator"

    assert_text "System administrator was successfully created"
    click_on "Back"
  end

  test "updating a System administrator" do
    visit system_administrators_url
    click_on "Edit", match: :first

    click_on "Update System administrator"

    assert_text "System administrator was successfully updated"
    click_on "Back"
  end

  test "destroying a System administrator" do
    visit system_administrators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "System administrator was successfully destroyed"
  end
end
