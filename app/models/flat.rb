class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true
  validates :address, presence: true
  validates :description, length: { minimum: 10 }
  validates :price_per_night, numericality: { only_integer: true }
  validates :number_of_guests, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
