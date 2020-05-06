require 'test_helper'

class SystemAdministratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @system_administrator = system_administrators(:one)
  end

  test "should get index" do
    get system_administrators_url
    assert_response :success
  end

  test "should get new" do
    get new_system_administrator_url
    assert_response :success
  end

  test "should create system_administrator" do
    assert_difference('SystemAdministrator.count') do
      post system_administrators_url, params: { system_administrator: {  } }
    end

    assert_redirected_to system_administrator_url(SystemAdministrator.last)
  end

  test "should show system_administrator" do
    get system_administrator_url(@system_administrator)
    assert_response :success
  end

  test "should get edit" do
    get edit_system_administrator_url(@system_administrator)
    assert_response :success
  end

  test "should update system_administrator" do
    patch system_administrator_url(@system_administrator), params: { system_administrator: {  } }
    assert_redirected_to system_administrator_url(@system_administrator)
  end

  test "should destroy system_administrator" do
    assert_difference('SystemAdministrator.count', -1) do
      delete system_administrator_url(@system_administrator)
    end

    assert_redirected_to system_administrators_url
  end
end
