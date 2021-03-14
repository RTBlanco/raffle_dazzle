class RafflesController < ApplicationController
  def home 
  end 

  def browse
  end 

  def show 
    @raffles = current_user.raffles
  end 

  def new
    @raffle = Raffle.new
  end

  def create 
    raffle = current_user.raffles.build(raffle_params)
    if raffle.save
      redirect_to home_path, notice: 'Raffle created' 
    else
      redirect_to new_raffle_path, alert: "something is wrong"
    end
  end

  private

  def raffle_params 
    params.require(:raffle).permit(:title, :item, :goal, :description)
  end
end 