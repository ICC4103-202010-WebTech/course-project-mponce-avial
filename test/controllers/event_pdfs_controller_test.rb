require 'test_helper'

class EventPdfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_pdf = event_pdfs(:one)
  end

  test "should get index" do
    get event_pdfs_url
    assert_response :success
  end

  test "should get new" do
    get new_event_pdf_url
    assert_response :success
  end

  test "should create event_pdf" do
    assert_difference('EventPdf.count') do
      post event_pdfs_url, params: { event_pdf: {  } }
    end

    assert_redirected_to event_pdf_url(EventPdf.last)
  end

  test "should show event_pdf" do
    get event_pdf_url(@event_pdf)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_pdf_url(@event_pdf)
    assert_response :success
  end

  test "should update event_pdf" do
    patch event_pdf_url(@event_pdf), params: { event_pdf: {  } }
    assert_redirected_to event_pdf_url(@event_pdf)
  end

  test "should destroy event_pdf" do
    assert_difference('EventPdf.count', -1) do
      delete event_pdf_url(@event_pdf)
    end

    assert_redirected_to event_pdfs_url
  end
end
