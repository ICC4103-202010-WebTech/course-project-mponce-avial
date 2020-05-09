require 'test_helper'

class InboxControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inbox = inbox(:one)
  end

  test "should get index" do
    get inbox_index_url
    assert_response :success
  end

  test "should get new" do
    get new_inbox_url
    assert_response :success
  end

  test "should create inbox" do
    assert_difference('Inbox.count') do
      post inbox_index_url, params: { inbox: {  } }
    end

    assert_redirected_to inbox_url(Inbox.last)
  end

  test "should show inbox" do
    get inbox_url(@inbox)
    assert_response :success
  end

  test "should get edit" do
    get edit_inbox_url(@inbox)
    assert_response :success
  end

  test "should update inbox" do
    patch inbox_url(@inbox), params: { inbox: {  } }
    assert_redirected_to inbox_url(@inbox)
  end

  test "should destroy inbox" do
    assert_difference('Inbox.count', -1) do
      delete inbox_url(@inbox)
    end

    assert_redirected_to inbox_index_url
  end
end
