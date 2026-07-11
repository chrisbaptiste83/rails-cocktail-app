class User < ApplicationRecord 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cocktail_recipes, dependent: :destroy
  has_many :comments,         dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  has_many :ingredients, through: :cocktail_recipes
  has_many :ai_conversations, dependent: :destroy
end
