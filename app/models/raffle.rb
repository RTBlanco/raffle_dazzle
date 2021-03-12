class Raffle < ApplicationRecord
  belongs_to :user

  has_many :entries
  has_many :entered_users, through: :entries
end
