class EntriesController < ApplicationController
  before_action :set_raffle, :authenticate_user!
  skip_before_action :set_raffle, only: [:index]

  def users
    @entries =  @raffle.entries.order(:created_at).reverse_order.page(params[:page])
  end

  def index 
    @raffles = current_user.entered_raffles.order(:created_at).reverse_order.page(params[:page])
  end

  def new
    @entry = Entry.new
  end

  def create 
    if @raffle && can_afford?(@raffle)

      @entry = comment_params[:comment].nil? && comment_params[:comment] == '' ? @raffle.entries.build(user_id: current_user.id) : @raffle.entries.build(user_id: current_user.id,comment: comment_params[:comment])
      if @entry.valid?
        current_user.funds -= @raffle.cost
        @raffle.amount += @raffle.cost
        current_user.save
        @raffle.save
        @entry.save
        redirect_to raffle_path(@raffle), notice: "you succsefully entered the raffle"
      else
        render :new
      end 
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

  def comment_params 
    params.require(:entry).permit(:comment)
  end
end 