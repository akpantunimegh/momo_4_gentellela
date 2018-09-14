class InstantsController < ApplicationController
  before_action :set_user
  before_action :set_account
  before_action :set_instant, only: [:show, :edit, :update, :destroy]

  # GET /instants
  # GET /instants.json
  def index
    @instants = Instant.all
  end

  # GET /instants/1
  # GET /instants/1.json
  def show
  end

  # GET /instants/new
  def new
    @instant = @account.instants.build
  end

  # GET /instants/1/edit
  def edit
  end

  # POST /instants
  # POST /instants.json
  def create
    @instant = @account.instants.build(instant_params)

    respond_to do |format|
      if @instant.save
        format.html { redirect_to @instant, notice: 'Instant was successfully created.' }
        format.json { render :show, status: :created, location: @instant }
      else
        format.html { render :new }
        format.json { render json: @instant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instants/1
  # PATCH/PUT /instants/1.json
  def update
    respond_to do |format|
      if @instant.update(instant_params)
        format.html { redirect_to @instant, notice: 'Instant was successfully updated.' }
        format.json { render :show, status: :ok, location: @instant }
      else
        format.html { render :edit }
        format.json { render json: @instant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instants/1
  # DELETE /instants/1.json
  def destroy
    @instant.destroy
    respond_to do |format|
      format.html { redirect_to instants_url, notice: 'Instant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to errors_notfound_path, notice: 'User not found.' }
      format.json { head :no_content}
    end

  end

  def set_account
    @account = Account.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to errors_notfound_path, notice: 'Account not found.' }
      format.json { head :no_content}
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_instant
      @instant = @account.instants.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instant_params
      params.require(:instant).permit(:Oid, :follio, :window_hours, :token_code, :date_of_confirmation, :date_of_cancelation, :device_of_cancelation, :device_of_transaction, :device_of_confirmation, :confirmed, :comment, :account_id)
    end
end
