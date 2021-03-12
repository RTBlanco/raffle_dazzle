class User < ApplicationRecord
  has_many :raffles

  has_many :entries
  has_many :entered_raffles , through: :entries
end
