require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post :create, transaction: { Oid: @transaction.Oid, account_id: @transaction.account_id, action_class: @transaction.action_class, action_code: @transaction.action_code, chain_id: @transaction.chain_id, charges: @transaction.charges, comment: @transaction.comment, confirmed: @transaction.confirmed, date_of_cancelation: @transaction.date_of_cancelation, date_of_confirmation: @transaction.date_of_confirmation, date_of_transaction: @transaction.date_of_transaction, device_of_cancelation: @transaction.device_of_cancelation, device_of_confirmation: @transaction.device_of_confirmation, device_of_transaction: @transaction.device_of_transaction, follio: @transaction.follio, source_account: @transaction.source_account, source_identifier: @transaction.source_identifier, target_account: @transaction.target_account, target_identifier: @transaction.target_identifier, token_code: @transaction.token_code, value: @transaction.value, window_days: @transaction.window_days }
    end

    assert_redirected_to transaction_path(assigns(:transaction))
  end

  test "should show transaction" do
    get :show, id: @transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaction
    assert_response :success
  end

  test "should update transaction" do
    patch :update, id: @transaction, transaction: { Oid: @transaction.Oid, account_id: @transaction.account_id, action_class: @transaction.action_class, action_code: @transaction.action_code, chain_id: @transaction.chain_id, charges: @transaction.charges, comment: @transaction.comment, confirmed: @transaction.confirmed, date_of_cancelation: @transaction.date_of_cancelation, date_of_confirmation: @transaction.date_of_confirmation, date_of_transaction: @transaction.date_of_transaction, device_of_cancelation: @transaction.device_of_cancelation, device_of_confirmation: @transaction.device_of_confirmation, device_of_transaction: @transaction.device_of_transaction, follio: @transaction.follio, source_account: @transaction.source_account, source_identifier: @transaction.source_identifier, target_account: @transaction.target_account, target_identifier: @transaction.target_identifier, token_code: @transaction.token_code, value: @transaction.value, window_days: @transaction.window_days }
    assert_redirected_to transaction_path(assigns(:transaction))
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete :destroy, id: @transaction
    end

    assert_redirected_to transactions_path
  end
end
