class Category < ApplicationRecord
    has_many :cocktail_recipes, dependent: :nullify

    validates :name, presence: true, uniqueness: true

    def self.search(search)
        where("name ILIKE ?", "%#{search}%")
    end

end
