class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer

  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  def edit
  end

  def update
  end

  def withdraw
  end

  def unsubscribe
    @customer = Customer
    @customer.update(flag: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

end
