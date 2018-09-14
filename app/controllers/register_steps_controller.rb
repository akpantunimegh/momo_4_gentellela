class RegisterStepsController < ApplicationController
  include Wicked::Wizard
  steps :basic_do, :personal_do, :account_do

  def show
   # @user = current_user
   # case step
   #   when :personal_do
   #     @personal = @user.personal_do
   # end
   # render_wizard
  end

  def update
    #  @user = current_user
    # case step#
    #   when :confirm_password
    #     @user.update_attributes = params[:user]
    #  end
    # sign_in(@user, bypass: true) # needed for devise
    #  render_wizard @user
  end

  # def finish_wizard_path
  #  user_path(current_user)
  # end


  private

  # def redirect_to_finish_wizard
  #  redirect_to root_url, notice: "Thank you for signing up."
  # end


end

class BasicInfoForm < Reform::Form
  property :first_name
  property :last_name
end

class ProfileForm < Reform::Form
  property :bio
end

class ContactDetailsForm
  property :phone
end