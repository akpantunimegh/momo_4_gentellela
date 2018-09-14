class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 before_action :authenticate_user! , except: [:index, :list, :register]
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_action

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end



  def store_action
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end
  # Overwriting the sign_in redirect path method
  def after_sign_up_path_for(resource_or_scope)
    if resource_or_scope == :user
      users_path(:user)
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :user
      dash_user_path(:user)
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end


  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      subscriptions_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end


  def set_locale
    I18n.locale = params[:locale]
  end

  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end


  private

end
