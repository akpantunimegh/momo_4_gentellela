class UsersController < ApplicationController
  before_action :set_user, only: [:show, :dash, :profile, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def dash
  end

  def profile

  end
  # GET /users/1
  # GET /users/1.json
  def show

    #send_data @user.photo,  :type=> @user.mime_type, :disposition=> 'inline'
    #send_data image.data, type: @user.mime_type, disposition: 'inline'
    #send_data image.data, type: image.content_type, disposition: 'inline'
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
    #  if user_params[:user][:photo]
    #      @user.photo= user_params[:user][:photo].read
    #     @user.mime_type= user_params[:user][:photo].content_type
    #     end
      if @user.save
        redirect_to new_user_account_path(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :dash, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
        if user_params[:photo]
         @user.photo= user_params[:user][:photo].read
         @user.mime_type= user_params[:user][:photo].content_type
       end

      if @user.update(user_params)
        format.html { redirect_to [@user,@account], notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def serve

    send_data(@user.photo, :type => @user.mime_type, :filename => "#{@user.username}.jpg", :disposition => "inline")
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to welcome_index_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:Oid, :file,:mime_type, :username, :email, :last_name, :middle_name, :first_name, :phone, :photo, :date_of_birth, :account_reference)
    end
end
