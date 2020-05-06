require "application_system_test_case"

class EventGuestsTest < ApplicationSystemTestCase
  setup do
    @event_guest = event_guests(:one)
  end

  test "visiting the index" do
    visit event_guests_url
    assert_selector "h1", text: "Event Guests"
  end

  test "creating a Event guest" do
    visit event_guests_url
    click_on "New Event Guest"

    click_on "Create Event guest"

    assert_text "Event guest was successfully created"
    click_on "Back"
  end

  test "updating a Event guest" do
    visit event_guests_url
    click_on "Edit", match: :first

    click_on "Update Event guest"

    assert_text "Event guest was successfully updated"
    click_on "Back"
  end

  test "destroying a Event guest" do
    visit event_guests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event guest was successfully destroyed"
  end
end
