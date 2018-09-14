require 'test_helper'

class InstantsControllerTest < ActionController::TestCase
  setup do
    @instant = instants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instant" do
    assert_difference('Instant.count') do
      post :create, instant: { Oid: @instant.Oid, account_id: @instant.account_id, comment: @instant.comment, confirmed: @instant.confirmed, date_of_cancelation: @instant.date_of_cancelation, date_of_confirmation: @instant.date_of_confirmation, device_of_cancelation: @instant.device_of_cancelation, device_of_confirmation: @instant.device_of_confirmation, device_of_transaction: @instant.device_of_transaction, follio: @instant.follio, token_code: @instant.token_code, window_hours: @instant.window_hours }
    end

    assert_redirected_to instant_path(assigns(:instant))
  end

  test "should show instant" do
    get :show, id: @instant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instant
    assert_response :success
  end

  test "should update instant" do
    patch :update, id: @instant, instant: { Oid: @instant.Oid, account_id: @instant.account_id, comment: @instant.comment, confirmed: @instant.confirmed, date_of_cancelation: @instant.date_of_cancelation, date_of_confirmation: @instant.date_of_confirmation, device_of_cancelation: @instant.device_of_cancelation, device_of_confirmation: @instant.device_of_confirmation, device_of_transaction: @instant.device_of_transaction, follio: @instant.follio, token_code: @instant.token_code, window_hours: @instant.window_hours }
    assert_redirected_to instant_path(assigns(:instant))
  end

  test "should destroy instant" do
    assert_difference('Instant.count', -1) do
      delete :destroy, id: @instant
    end

    assert_redirected_to instants_path
  end
end
