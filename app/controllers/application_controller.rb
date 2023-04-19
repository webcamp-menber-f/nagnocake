class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # strong parameterで姓と名の属性(firstNameとlastName)をpermitする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_f, :last_name_f, :post, :place, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :first_name_f, :last_name_f, :post, :place, :phone])
  end
end

