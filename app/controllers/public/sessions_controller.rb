# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def refect_customer
    @customer = User.fing_by(email: params[:customer][:email])
    if @customer
      if @Customer.valid_password?(params[:user][:password]) && (@Customer.flag == false)
        flash[:notice] = "退会済みです。再度ご登録してご利用ください。"
        redirect_to new_customer_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
