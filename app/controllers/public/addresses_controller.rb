class Public::AddressesController < ApplicationController

  def index
   @addresses = Address.all
   @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "Address was successfully created."
      redirect_to addresses_path
    else
      @addresses= Address.all
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "Address was successfully updated."
      redirect_to addresses_path(@address.id)
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] ="Address was successfully destroyed."
    redirect_to addresses_path
  end

private
  def address_params
    params.require(:address).permit(:place, :postal_code ,:name)
  end
  
end
