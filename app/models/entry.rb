class Entry < ApplicationRecord
  paginates_per 4
  validates :comment, length: { maximum: 20 }

  belongs_to :user
  belongs_to :raffle

  belongs_to :entered_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :entered_raffle, class_name: 'Raffle', foreign_key: 'raffle_id'
end
