module RafflesHelper
  def percentage(raffle)
    (raffle.amount.to_int * 100 ) / raffle.goal.to_int 
  end

  def is_complete?(raffle)
    percentage(raffle) == 100
  end
end