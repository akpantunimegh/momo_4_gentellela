require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { Oid: @payment.Oid, action_code: @payment.action_code, charges: @payment.charges, date_of_entry: @payment.date_of_entry, follio: @payment.follio, instant_id: @payment.instant_id, paid: @payment.paid, payment_class: @payment.payment_class, source_account: @payment.source_account, source_identifier: @payment.source_identifier, target_account: @payment.target_account, target_identifier: @payment.target_identifier, token_code: @payment.token_code, value: @payment.value }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
  end

  test "should update payment" do
    patch :update, id: @payment, payment: { Oid: @payment.Oid, action_code: @payment.action_code, charges: @payment.charges, date_of_entry: @payment.date_of_entry, follio: @payment.follio, instant_id: @payment.instant_id, paid: @payment.paid, payment_class: @payment.payment_class, source_account: @payment.source_account, source_identifier: @payment.source_identifier, target_account: @payment.target_account, target_identifier: @payment.target_identifier, token_code: @payment.token_code, value: @payment.value }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
