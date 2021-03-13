class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  # Associations 
  has_many :raffles
  has_many :entries
  has_many :entered_raffles , through: :entries
end
