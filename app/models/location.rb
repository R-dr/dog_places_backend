class Location < ApplicationRecord
  # Validations
  validates :name, :category, presence: true
  validates :description, length: { maximum: 5000 }

  # Relationships
  has_many :comments, dependent: :destroy
  
  # Allows many facilities to be listed for each location
  has_many :location_facilities, dependent: :destroy
  has_many :locations through: :location_facilities
end
