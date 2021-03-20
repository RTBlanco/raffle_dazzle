class EntriesController < ApplicationController
  def users
    # binding.pry
    @raffle = Raffle.find(params[:raffle_id])
  end

  def index 
    @raffles = current_user.entered_raffles 
  end

  def create 
    raffle = Raffle.find(params[:raffle_id])
    if raffle && can_afford?(raffle)
      purhase(raffle)
      redirect_to raffle_path(raffle), notice: "you succsefully entered the raffle"
    else
      redirect_to raffle_path(raffle), alert: "Not enough funds"
    end 
  end

  def winner 
    @raffle = Raffle.find(params[:raffle_id])
    @winner = @raffle.entered_users.sample
    @raffle.winner = @winner
    @raffle.save
    redirect_to raffle_entered_users_path
  end

  private

  def can_afford?(raffle)
    current_user.funds >= raffle.cost 
  end
  
  def purhase(raffle)
    current_user.funds -= raffle.cost
    raffle.amount += raffle.cost
    current_user.save
    raffle.save
    current_user.entered_raffles << raffle
  end
end 