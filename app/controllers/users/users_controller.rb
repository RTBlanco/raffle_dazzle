class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @account = User.find_by(username: params[:username])
    if @account.nil?
      @account = current_user
      @raffles = Raffle.first_6(@account.id)
    elsif @account.nil? && !user_signed_in?
      flash[:alert] = "#{params[:user_username]} could not be found."
    else 
      @raffles = Raffle.first_6(@account.id)
    end
  end

  def funds 
    current_user.funds += fund_params[:funds].to_f
    current_user.save
  end
  
  private  
  
  def fund_params
    params.require(:user).permit(:funds)
  end
end 