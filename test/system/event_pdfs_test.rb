require "application_system_test_case"

class EventPdfsTest < ApplicationSystemTestCase
  setup do
    @event_pdf = event_pdfs(:one)
  end

  test "visiting the index" do
    visit event_pdfs_url
    assert_selector "h1", text: "Event Pdfs"
  end

  test "creating a Event pdf" do
    visit event_pdfs_url
    click_on "New Event Pdf"

    click_on "Create Event pdf"

    assert_text "Event pdf was successfully created"
    click_on "Back"
  end

  test "updating a Event pdf" do
    visit event_pdfs_url
    click_on "Edit", match: :first

    click_on "Update Event pdf"

    assert_text "Event pdf was successfully updated"
    click_on "Back"
  end

  test "destroying a Event pdf" do
    visit event_pdfs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event pdf was successfully destroyed"
  end
end
