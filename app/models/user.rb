class User < ApplicationRecord 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 

    has_many :cocktail_recipes 
    has_many :comments 
    validates :username, presence: true, uniqueness: true    
    validates :email, presence: true
    validates :birthday, presence: true
    validate :validate_age
  
    private
     
    def validate_age
        if birthday.present? && birthday > 21.years.ago
            errors.add(:birthday, 'You should be over 21 years old to create an Account.')
        end
    end
  end