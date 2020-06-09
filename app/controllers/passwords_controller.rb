class PasswordsController < ApplicationController
module V1
	skip_before_action :authenticate_end_user_from_token!, only: [:create, :update]

    def create
      end_user = EndUser.find_by(email: create_params[:email])
      end_user&.send_reset_password_instructions
      render json: {}
    end

    def update
      end_user = EndUser.reset_password_by_token(update_params)
      render json: end_user, status: :ok, serializer: V1::EndUserSerializer
    end

    private

    def create_params
      params.require(:end_user).permit(:email)
    end

    def update_params
      params.require(:end_user).permit(:password, :password_confirmation, :reset_password_token)
    end
  end
end