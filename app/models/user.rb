class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable,
          omniauth_providers: %i[facebook]

  # Associations 
  has_many :raffles#, class_name: "Raffle", foreign_key: "user_id"
  has_many :raffles_won, class_name: "Raffle", foreign_key: "winner_id"

  has_many :entries
  has_many :entered_raffles , through: :entries



  def to_param
    self.username
  end

  def self.from_omniauth(auth)
    # binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.username = user.name.delete(' ')   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
