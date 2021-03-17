class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  # Associations 
  has_many :raffles#, class_name: "Raffle", foreign_key: "user_id"
  has_many :raffles_won, class_name: "Raffle", foreign_key: "winner_id"

  has_many :entries
  has_many :entered_raffles , through: :entries



  def to_param
    self.username
  end

end
