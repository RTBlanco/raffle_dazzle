class Users::UsersController < ApplicationController
  def show
    @account = User.find_by(username: params[:username])
    # binding.pry
    if @account.nil?
      @account = current_user
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