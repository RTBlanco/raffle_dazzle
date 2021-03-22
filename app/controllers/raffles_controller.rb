class RafflesController < ApplicationController
  before_action :set_user_raffle, only: [:edit, :update]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:browse, :show]
  


  def browse
    begin
      @raffles = Raffle.raffle_search(raffle_params.to_hash['title']).order(:created_at).reverse_order.page(params[:page]) 
      @message = "Your search - #{raffle_params.to_hash['title']} - did not match any raffle tiles."
    rescue ActionController::ParameterMissing
      @raffles = Raffle.order(:created_at).reverse_order.page(params[:page])
    end
  end 

  def index
    user = User.find_by(username: params[:user_username])
    if user.nil? 
      user = current_user
      flash[:alert] = "#{params[:user_username]} could not be found."
    end
    @raffles = user.raffles.order(:created_at).reverse_order.page(params[:page])
  end

  def show 
    @raffle = Raffle.find(params[:id])
  end 

  def new
    @raffle = Raffle.new
  end

  def create 
    @raffle = current_user.raffles.build(raffle_params)
    if @raffle.valid?
      @raffle.cost = @raffle.goal / 20
      @raffle.save
      redirect_to user_raffles_path(current_user), notice: 'Raffle created' 
    else
      render :new
    end
  end

  def edit
    if @raffle.nil? 
      redirect_to browse_path, alert: "Raffle unkown"
    end 
  end 

  def update
    if @raffle.update(raffle_params)
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
    current_user.entered_raffles << raffle
    current_user.save
    raffle.save
  end
   
  def set_user_raffle
    @raffle = current_user.raffles.find(params[:id])
  end
end 