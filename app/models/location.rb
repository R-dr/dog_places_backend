class Location < ApplicationRecord
  # Geocoding goodness
  geocoded_by :address
  after_validation :geocode
  # Validations
  validates :name, :location_type, :address, presence: true

  validates :description, length: { maximum: 5000 }, presence: :true

  # Relationships
  belongs_to :location_type
  belongs_to :user
  has_many :reviews, dependent: :destroy
  # Allows many facilities to be listed for each location
  has_many :location_facilities, dependent: :destroy
  has_many :facilities, through: :location_facilities

  # Image uploading
  has_many_attached :images
  # Allows users to select favourites
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  def transform_json
    return{
      user: user.username,
      location_type: location_type.name,
      name: name,
      address: address,
      description: description,
      longitude: longitude,
      latitude: latitude,
      posted: created_at,
      edited: updated_at
    }
  end
end
