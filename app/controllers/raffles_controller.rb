class RafflesController < ApplicationController
  def home 
  end 

  def browse
    @raffles = Raffle.all
  end 

  def index
    @raffles = current_user.raffles
  end

  def show 
    @raffle = Raffle.find(params[:id])
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

  def edit
    @raffle = current_user.raffles.find(params[:id]) #AREL to speed things up
  end 

  def update
    @raffle = current_user.raffles.find(params[:id]) #This is not dry user before_action
    @raffle.update(raffle_params)
    if @raffle.valid?
      redirect_to raffle_path(@raffle), notice: 'Raffle updated'
    else
      redirect_to edit_raffle_path, alert: "something is wrong"
    end
  end 

  private

  def raffle_params 
    params.require(:raffle).permit(:title, :item, :goal, :description)
  end
end 