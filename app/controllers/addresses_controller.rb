class AddressesController < ApplicationController
  def index
    @addresses = Addresse.all
    @addresse = Addresse.new
  end

  def create
    @addresses = Addresse.all
    @addresse = Addresse.new(addresse_params)
    @addresse.end_user_id = current_user.id
    if @addresse.save
    redirect_to addresse_path(@address), notice: "successfully create addresse!"
  else @addresses = Addresse
  end
end

  def edit
    @addresse = Addresse.find(params[:id])
    @addresse.end_user_id != current_user.id
    redirect_to addresses_path
  end

  def update
    @addresse = Addresse.find(params[:id])
    redirect_to addresses_path, notice: "successfully updated addresse!"
  end

  def destroy
    @addresse = Addresse.find(params[:id])
    @addresse.destroy
    redirect_to addresses_path, notice: "successfully delete addresse!"
  end

  private
  def addrese_params
    params.require(:addresse).premit(:address,:post_code,:name)
  end
end
