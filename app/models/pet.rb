class Pet < ApplicationRecord
  belongs_to :owner

  validates :name, presence: true
  validates :pet_type, presence: true

  def self.search(search)
    Pet.all.select do |pet|
      pet.pet_type.downcase == search.downcase
    end
  end
  
end
