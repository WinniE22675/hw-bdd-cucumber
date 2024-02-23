class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  # def self.from_omniauth(access_token)
  #   user = User.where(email: access_token.info.email).first
  #   unless user
  #     user = User.create(
  #       email: access_token.info.email,
  #       password: Devise.friendly_token[0,20]
  #     )
  #   end
  #   user.name = access_token.info.name
  #   user.image = access_token.info.image
  #   user.uid = access_token.uid
  #   user.provider = access_token.provider
  #   user.save

  #   user
  # end
end
