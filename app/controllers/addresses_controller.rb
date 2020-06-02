class AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @addresses = Address.all
    @address = Address.new(address_params)
    @address.end_user_id = current_user.id

      if @address.save
        redirect_to addresses_path(@address), notice: "successfully create addresse!"
      else @addresse = Address.all
        render 'index'
      end
  end

  def edit
    @address = Address.find(params[:id])
    @address.end_user_id != current_user.id
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(@address_params)
    redirect_to addresses_path, notice: "successfully updated addresse!"
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: "successfully delete addresse!"
  end

  private
  def address_params
    params.require(:address).permit(:address,:post_code,:name)
  end
end


