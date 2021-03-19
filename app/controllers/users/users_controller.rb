class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @account = User.find_by(username: params[:username])
    # binding.pry
    if @account.nil?
      @account = current_user
    elsif @account.nil? && !user_signed_in?
      flash[:alert] = "#{params[:user_username]} could not be found."
    end
  end

  def funds 
    amount = fund_params[:funds]
    current_user.funds += amount.to_f
    current_user.save
  end

  private 

  def fund_params
    params.require(:user).permit(:funds)
  end
end 