require 'test_helper'

class Admin::MessageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_message_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_message_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_message_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_message_destroy_url
    assert_response :success
  end

end
