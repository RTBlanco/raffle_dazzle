class RafflesController < ApplicationController
  # def account
  #   @account = User.find_by(username: params[:username])
  #   unless @account
  #     redirect_to account_path(current_user), alert: "Could not find user"
  #   end
  # end 

  def enter 
    raffle = Raffle.find(params[:id])
    if can_afford?(raffle)
      purhase(raffle)
      redirect_to raffle_path(raffle), notice: "you succsefully entered the raffle"
    else
      redirect_to raffle_path(raffle), alert: "Not enough funds"
    end 
  end

  def browse
    @raffles = Raffle.all
  end 

  def index
    user = User.find_by(username: params[:username])
    if user.nil? 
      user = current_user
    end
    @raffles = user.raffles
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
      redirect_to user_raffles_path(current_user), notice: 'Raffle created' 
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
    params.require(:raffle).permit(:title, :item, :cost, :goal, :description)
  end

  def can_afford?(raffle)
    current_user.funds >= raffle.cost 
  end
  
  def purhase(raffle)
    current_user.funds -= raffle.cost
    raffle.user.funds += raffle.cost
    current_user.save
    raffle.user.save
    current_user.entered_raffles << raffle
  end
end 