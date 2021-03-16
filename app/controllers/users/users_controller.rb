class Users::UsersController < ApplicationController
  def show
    @account = User.find_by(username: params[:username])
    # binding.pry
    if @account.nil?
      @account = current_user
    end
  end
end 