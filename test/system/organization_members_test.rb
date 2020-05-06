require "application_system_test_case"

class OrganizationMembersTest < ApplicationSystemTestCase
  setup do
    @organization_member = organization_members(:one)
  end

  test "visiting the index" do
    visit organization_members_url
    assert_selector "h1", text: "Organization Members"
  end

  test "creating a Organization member" do
    visit organization_members_url
    click_on "New Organization Member"

    click_on "Create Organization member"

    assert_text "Organization member was successfully created"
    click_on "Back"
  end

  test "updating a Organization member" do
    visit organization_members_url
    click_on "Edit", match: :first

    click_on "Update Organization member"

    assert_text "Organization member was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization member" do
    visit organization_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization member was successfully destroyed"
  end
end
