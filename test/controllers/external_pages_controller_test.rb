require 'test_helper'

class ExternalPagesControllerTest < ActionController::TestCase
  test "should get about_us" do
    get :about_us
    assert_response :success
  end

  test "should get team" do
    get :team
    assert_response :success
  end

  test "should get faqs" do
    get :faqs
    assert_response :success
  end

end
