class Raffle < ApplicationRecord
  belongs_to :user

  has_one :winner, class_name: 'User', foreign_key: 'id'

  has_many :entries
  has_many :entered_users, through: :entries

  

  # Validations 
  validates :title, :item, :goal, :description, presence: true 
end
