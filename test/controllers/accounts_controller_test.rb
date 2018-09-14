require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, account: { Oid: @account.Oid, balance: @account.balance, bank: @account.bank, blocked: @account.blocked, code: @account.code, date_blocked: @account.date_blocked, date_of_expiry: @account.date_of_expiry, expired: @account.expired, name: @account.name, user_id: @account.user_id }
    end

    assert_redirected_to account_path(assigns(:account))
  end

  test "should show account" do
    get :show, id: @account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account
    assert_response :success
  end

  test "should update account" do
    patch :update, id: @account, account: { Oid: @account.Oid, balance: @account.balance, bank: @account.bank, blocked: @account.blocked, code: @account.code, date_blocked: @account.date_blocked, date_of_expiry: @account.date_of_expiry, expired: @account.expired, name: @account.name, user_id: @account.user_id }
    assert_redirected_to account_path(assigns(:account))
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account
    end

    assert_redirected_to accounts_path
  end
end
