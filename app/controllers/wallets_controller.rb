class WalletsController < ApplicationController
  before_action :set_user
  before_action :set_account
  before_action :set_wallet, only: [:show, :edit, :update, :destroy]

  # GET /wallets
  # GET /wallets.json
  def index
    @wallets = Wallet.all
  end

  # GET /wallets/1
  # GET /wallets/1.json
  def show
  end

  # GET /wallets/new
  def new
    @wallet = @account.wallets.build
  end

  # GET /wallets/1/edit
  def edit
  end

  # POST /wallets
  # POST /wallets.json
  def create
    @wallet = @account.wallets.build(wallet_params)

    respond_to do |format|
      if @wallet.save
        #redirect_to [@project,@forest, @tree]
        format.html { redirect_to [@user,@account,@wallet], notice: 'Wallet was successfully created.' }
        format.json { render :show, status: :created, location: @wallet }
      else
        format.html { render :new }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wallets/1
  # PATCH/PUT /wallets/1.json
  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to user_account_wallets_path , notice: 'Wallet was successfully updated.' }
        format.json { render :index, status: :ok, location: @wallet }
      else
        format.html { render :edit }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallets/1
  # DELETE /wallets/1.json
  def destroy
    @wallet.destroy
    respond_to do |format|
      format.html { redirect_to wallets_url, notice: 'Wallet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  #rescue ActiveRecord::RecordNotFound
  #  respond_to do |format|
  #    format.html { redirect_to errors_notfound_path, notice: 'User not found.' }
  #    format.json { head :no_content}
   # end

  end


  def set_account
    @account = Account.find(params[:account_id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to errors_notfound_path, notice: 'Account not found.' }
      format.json { head :no_content}
    end
  end


  # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = @account.wallets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wallet_params
      params.require(:wallet).permit(:Oid, :code, :name, :description, :blocked, :date_blocked, :balance, :account_id)
    end
end
