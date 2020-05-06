require "application_system_test_case"

class OrganizationAdminsTest < ApplicationSystemTestCase
  setup do
    @organization_admin = organization_admins(:one)
  end

  test "visiting the index" do
    visit organization_admins_url
    assert_selector "h1", text: "Organization Admins"
  end

  test "creating a Organization admin" do
    visit organization_admins_url
    click_on "New Organization Admin"

    click_on "Create Organization admin"

    assert_text "Organization admin was successfully created"
    click_on "Back"
  end

  test "updating a Organization admin" do
    visit organization_admins_url
    click_on "Edit", match: :first

    click_on "Update Organization admin"

    assert_text "Organization admin was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization admin" do
    visit organization_admins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization admin was successfully destroyed"
  end
end
