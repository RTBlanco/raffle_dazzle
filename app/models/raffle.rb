class Raffle < ApplicationRecord
  paginates_per 6

  belongs_to :user
  belongs_to :winner, class_name: 'User', foreign_key: 'winner_id', optional: true

  has_many :entries
  has_many :entered_users, through: :entries

  

  # Validations 
  validates :title, :item, :goal, :description, presence: true 

  scope :raffle_search, ->(title) {where("title LIKE ?", title) if title.present? } 
  scope :first_6, -> user_id {where("user_id = ?", user_id).order(:created_at).reverse_order.limit(6) }

end
