class EntriesController < ApplicationController
  before_action :set_raffle, :authenticate_user!
  skip_before_action :set_raffle, only: [:index]

  def users
    @users = @raffle.entered_users.order(:created_at).reverse_order.page(params[:page])
  end

  def index 
    @raffles = current_user.entered_raffles.order(:created_at).reverse_order.page(params[:page])
  end

  def create 
    if @raffle && can_afford?(@raffle)
      purhase(@raffle)
      redirect_to raffle_path(@raffle), notice: "you succsefully entered the raffle"
    else
      redirect_to raffle_path(@raffle), alert: "Not enough funds"
    end 
  end

  def winner 
    @raffle.winner = @raffle.entered_users.sample
    @raffle.user.funds += @raffle.amount
    @raffle.user.save
    @raffle.save
    redirect_to raffle_entered_users_path
  end

  private

  def set_raffle
    @raffle = Raffle.find(params[:raffle_id])
  end

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