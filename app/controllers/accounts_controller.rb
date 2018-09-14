class AccountsController < ApplicationController
  #before_action :set_user
  before_action :set_account, only: [:show, :dash, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  def list
    @accounts = Account.all
    if params[:account_reference]
      @account = Account.find(params[:account_reference])
    else
      #@staff = Staff.find(params[:search])
      @accounts = Account.all.order("account_reference DESC")
    end

  end

  def dash
    #@user = current_user
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show

  end

  def search

    if params[:search]
      @account = params[:search]
      #@staff = Staff.search(params[:search])
    else
      @account = Account.find(params[:search])
    end
  end

  # GET /accounts/new
  def new
    #@account = Account.new
    @account = @user.account.build
    @account.account_reference = @user.account_reference
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
   # @account = Account.new(account_params)
    @account =@user.accounts.build(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to [@user,@account], notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
    #rescue ActiveRecord::RecordNotFound
    #respond_to do |format|
      #format.html { redirect_to errors_user_path, notice: 'User not found.' }
      #format.json { head :no_content}
    #end

 # rescue ActiveRecord::RecordNotFound
  #  flash[:alert] = "User not found."
   # redirect_to errors_user_path
  end


    def set_account
      @account = Account.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { redirect_to errors_notfound_path, notice: 'Account not found.' }
        format.json { head :no_content}
        render users_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:Oid, :account_reference, :name, :balance, :blocked, :date_blocked, :expired, :date_of_expiry, :bank, :user_id)
    end
end
