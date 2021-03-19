class RafflesController < ApplicationController

  def browse
    # binding.pry
    @raffles = Raffle.raffle_search(raffle_params)
  end 

  def index
    user = User.find_by(username: params[:user_username])
    # binding.pry
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
    raffle.cost = raffle.goal / 20
    if raffle.save
      redirect_to user_raffles_path(current_user), notice: 'Raffle created' 
    else
      redirect_to new_raffle_path, alert: "something is wrong"
    end
  end

  def edit
    @raffle = current_user.raffles.find_by(id: params[:id]) #AREL to speed things up
    # binding.pry
    if @raffle.nil? 
      redirect_to browse_path, alert: "Raffle unkown"
    end 
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

  def destroy 
    Raffle.find(params[:id]).destroy
    redirect_to user_raffles_path(current_user)
  end

  private

  def raffle_params 
    params.require(:raffle).permit(:title, :item, :goal, :description)
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