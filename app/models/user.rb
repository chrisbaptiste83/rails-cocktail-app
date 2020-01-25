class User < ApplicationRecord 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github] 

    has_many :cocktail_recipes 
    has_many :comments 
    validates :username, presence: true, uniqueness: true    
    validates :email, presence: true
    #validates :birthday, presence: true
    validate :validate_age
  
    private
     
    def validate_age
        if birthday.present? && birthday > 21.years.ago
            errors.add(:birthday, 'You should be over 21 years old to create an Account.')
        end
    end 

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
          user.username = auth.info.name   # assuming the user model has a name
          # assuming the user model has an image
          # If you are using confirmable and the provider(s) you use validate emails, 
          # uncomment the line below to skip the confirmation emails.
          # user.skip_confirmation!
        end
      end

  end