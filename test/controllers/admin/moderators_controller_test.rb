require 'test_helper'

class Admin::ModeratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_moderators_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_moderators_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_moderators_update_url
    assert_response :success
  end

end
