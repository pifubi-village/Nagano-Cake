class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
  	@end_users = EndUser.page(params[:page])
  end

  def show
  	@end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to admin_end_user_path(@end_user.id), notice: "会員情報の編集が完了しました！"
    else
      render "edit"
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_active)
  end

end
