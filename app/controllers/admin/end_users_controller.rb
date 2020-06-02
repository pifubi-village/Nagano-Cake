class Admin::EndUsersController < ApplicationController
  def index
  	@end_users = EndUser.find
  end

  def show
  end

  def edit
  end

  def update
  end
end
