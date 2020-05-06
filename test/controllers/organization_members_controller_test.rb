require 'test_helper'

class OrganizationMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_member = organization_members(:one)
  end

  test "should get index" do
    get organization_members_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_member_url
    assert_response :success
  end

  test "should create organization_member" do
    assert_difference('OrganizationMember.count') do
      post organization_members_url, params: { organization_member: {  } }
    end

    assert_redirected_to organization_member_url(OrganizationMember.last)
  end

  test "should show organization_member" do
    get organization_member_url(@organization_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_member_url(@organization_member)
    assert_response :success
  end

  test "should update organization_member" do
    patch organization_member_url(@organization_member), params: { organization_member: {  } }
    assert_redirected_to organization_member_url(@organization_member)
  end

  test "should destroy organization_member" do
    assert_difference('OrganizationMember.count', -1) do
      delete organization_member_url(@organization_member)
    end

    assert_redirected_to organization_members_url
  end
end
