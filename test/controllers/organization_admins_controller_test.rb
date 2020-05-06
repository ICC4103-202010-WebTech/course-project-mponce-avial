require 'test_helper'

class OrganizationAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_admin = organization_admins(:one)
  end

  test "should get index" do
    get organization_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_admin_url
    assert_response :success
  end

  test "should create organization_admin" do
    assert_difference('OrganizationAdmin.count') do
      post organization_admins_url, params: { organization_admin: {  } }
    end

    assert_redirected_to organization_admin_url(OrganizationAdmin.last)
  end

  test "should show organization_admin" do
    get organization_admin_url(@organization_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_admin_url(@organization_admin)
    assert_response :success
  end

  test "should update organization_admin" do
    patch organization_admin_url(@organization_admin), params: { organization_admin: {  } }
    assert_redirected_to organization_admin_url(@organization_admin)
  end

  test "should destroy organization_admin" do
    assert_difference('OrganizationAdmin.count', -1) do
      delete organization_admin_url(@organization_admin)
    end

    assert_redirected_to organization_admins_url
  end
end
