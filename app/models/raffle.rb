class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :winner, class_name: 'User', foreign_key: 'winner_id', optional: true

  # has_one :winner, class_name: 'User', foreign_key: 'id'

  has_many :entries
  has_many :entered_users, through: :entries

  

  # Validations 
  validates :title, :item, :goal, :description, presence: true 

  scope :raffle_search, ->(title) {where("name LIKE ?", title)}
end
